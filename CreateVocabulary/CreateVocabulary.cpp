#include <iostream>
#include <vector>
#include <fstream>
#include <string>

// DBoW2
#include "DBoW2.h" // defines OrbVocabulary and OrbDatabase

#include <DUtils/DUtils.h>
#include <DVision/DVision.h>

// OpenCV
#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/features2d.hpp>

using namespace DBoW2;
using namespace DUtils;
using namespace std;

void loadFeatures(vector<vector<cv::Mat > > &features);
void changeStructure(const cv::Mat &plain, vector<cv::Mat> &out);
void testVocCreation(const vector<vector<cv::Mat > > &features);
void testDatabase(const vector<vector<cv::Mat > > &features);
void wait();
int LoadImageList();
string ReadLine(int line);

int NIMAGES; // number of training images
char ImageList[256];

int main()
{
  vector<vector<cv::Mat > > features;

  NIMAGES = LoadImageList();
  if(NIMAGES != 0)
    cout << endl << "The number of images is: " << NIMAGES << endl << endl;
  else
    cout << endl << "Error in image number, please check the file you loaded." << endl << endl;

  loadFeatures(features); // 计算并保存输入训练图像的特征

  testVocCreation(features); // 测试训练出来的字典，并保存该字典

  // wait();

  // testDatabase(features); // 测试数据集

  return 0;
}

//-------------------------------成员函数----------------------------------
// 函数功能：读取txt文件的行数，一行对应一张图片，即读取图片数
int LoadImageList()
{
  cout <<"Please set the path to the image list:"<<endl;
  cin >> ImageList;
  ifstream ImgList;
  ImgList.open(ImageList,ios::in); // C++ 在读取文件的时候文件名必须用char[]，不能用string类
                                   // 因为C++的string类无法作为open函数的参数
  if(ImgList.fail())
  {
    cerr << "Unable to load the image list. Please check the path or file." << endl;
    return 0;
  }
  else
  {
    cout << "Successfully Loaded." << endl;
    int n = 0;
    string tmp;
    while(getline(ImgList,tmp,'\n'))
            n++;
    ImgList.close();
    return n;
  }
}

// 函数功能：读取txt文件中的某一行
string ReadLine(int line)
{
    int i=0;
    string temp;
    fstream file;  
    file.open(ImageList,ios::in);  
    while(getline(file,temp)&&i<line-1)
        i++;
    file.close();  
    return temp;  
}  

void loadFeatures(vector<vector<cv::Mat > > &features)
{
  features.clear();
  features.reserve(NIMAGES);

  cv::Ptr<cv::ORB> orb = cv::ORB::create(); // opencv3.1及以上版本的写法
  // cv::ORB orb(500); // opencv 2.4.8版本的写法
                       // 其余参数均为默认值

  cout << "Extracting ORB features. This may take a long time." << endl;
  for(int i = 1; i <= NIMAGES; ++i)
  {
    string ss=ReadLine(i);
    
    cv::Mat image = cv::imread(ss, 0); // 读入并转换成灰度图像
    cv::Mat mask;
    vector<cv::KeyPoint> keypoints;
    cv::Mat descriptors;

    orb->detectAndCompute(image, mask, keypoints, descriptors); // opencv3.1及以上版本的写法
    // orb.detect(image, keypoints); // opencv 2.4.8版本的写法
    // orb.compute(image, keypoints, descriptors); // opencv 2.4.8版本的写法

    features.push_back(vector<cv::Mat >());
    changeStructure(descriptors, features.back());

    cout << "Processing " << i << "/" <<NIMAGES << '\r';
    fflush(stdout); // 记住用fflush，不然输出会缓冲，会积压在一起
                    // 平时的endl除了有换行功能之外，另一个很重要的功能就是更新数据流，防止缓冲积压
  }
  
  cout << "ORB features loaded." << endl << endl;
}

void changeStructure(const cv::Mat &plain, vector<cv::Mat> &out)
{
  out.resize(plain.rows);

  for(int i = 0; i < plain.rows; ++i)
    out[i] = plain.row(i);
}

void testVocCreation(const vector<vector<cv::Mat > > &features)
{
  // branching factor and depth levels 
  const int k = 10;
  const int L = 6; // k=10, L=6是ORB_SLAM2中字典的大小
  const WeightingType weight = TF_IDF;
  const ScoringType score = L1_NORM;

 /**
   * Initiates an empty vocabulary
   * @param k branching factor
   * @param L depth levels
   * @param weighting weighting type
   * @param scoring scoring type
   */
  OrbVocabulary voc(k, L, weight, score);

  cout << "Creating a " << k << "^" << L << " vocabulary..." << endl;
  voc.create(features);
  cout << "Done" << endl;

  cout << "Vocabulary information: " << endl << voc << endl << endl;

  // // 用于测试字典的分类特性，若只生成字典则不需要执行这一步，否则会非常耗费时间
  // // let‘s do something with this vocabulary
  // cout << "Matching images against themselves (0 low, 1 high): " << endl;
  // BowVector v1, v2;
  // for(int i = 0; i < NIMAGES; i++)
  // {
  //   voc.transform(features[i], v1);
  //   for(int j = 0; j < NIMAGES; j++)
  //   {
  //     voc.transform(features[j], v2);
      
  //     double score = voc.score(v1, v2);
  //     cout << "Image " << i << " vs Image " << j << ": " << score << endl;
  //   }
  // }

  cout << endl << "Saving vocabulary..." << endl;
  voc.save("Vocabulary.yml.gz");
  cout << "Done" << endl;
}

void wait()
{
  cout << endl << "Press enter to continue" << endl;
  getchar();
}

void testDatabase(const vector<vector<cv::Mat > > &features)
{
  cout << "Creating a small database..." << endl;

  // load the vocabulary from disk
  OrbVocabulary voc("Vocabulary.yml.gz");
  
  OrbDatabase db(voc, false, 0); // false = do not use direct index (so ignore the last param)
  // The direct index is useful if we want to retrieve the features that belong to some vocabulary node.
  // db creates a copy of the vocabulary, we may get rid of "voc" now

  // add images to the database
  for(int i = 0; i < NIMAGES; i++)
    db.add(features[i]);

  cout << "... done!" << endl;

  cout << "Database information: " << endl << db << endl;

  // and query the database
  cout << "Querying the database: " << endl;

  QueryResults ret;
  for(int i = 0; i < NIMAGES; i++)
  {
    db.query(features[i], ret, 4);

    // ret[0] is always the same image in this case, because we added it to the 
    // database. ret[1] is the second best match.
    cout << "Searching for Image " << i << ". " << ret << endl;
  }

  cout << endl;

  // we can save the database. The created file includes the vocabulary and the entries added
  cout << "Saving database..." << endl;
  db.save("small_db.yml.gz");
  cout << "... done!" << endl;
  
  // // once saved, we can load it again  
  // cout << "Retrieving database once again..." << endl;
  // OrbDatabase db2("small_db.yml.gz");
  // cout << "... done! This is: " << endl << db2 << endl;
}