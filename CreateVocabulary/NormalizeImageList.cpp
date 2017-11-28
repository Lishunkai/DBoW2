#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int LoadImageList();
string ReadLine(int line);
void NormalizeImageList();

int NIMAGES; // number of training images
char ImageList[256];

int main()
{
  NIMAGES = LoadImageList();
  NormalizeImageList();

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
    cout << "Successfully Loaded." << endl << endl;
    int n = 0;
    string tmp;
    while(getline(ImgList,tmp,'\n'))
            n++;
    ImgList.close();
    return n;
  }
}

// 函数功能：将image list规范化，便于今后读取
void NormalizeImageList()
{
    ifstream ImgList;
    ImgList.open(ImageList,ios::in);
    string HeadPath;
    cout << "Please input the head path of images mentioned in image list:" << endl;
    cout << "(Eg: If the images are restored in '/home/username/DataFiles/..., you only need to input '/home/username/') " << endl;
    cin >> HeadPath;

    ofstream Normalized;
    Normalized.open("NormalizedImageList.txt",ios::trunc);  //ios::trunc表示在打开文件前将文件清空,由于是写入,文件不存在则创建
    for(int i=1;i<=NIMAGES;++i)
    {
        string ss = ReadLine(i);
        string cp;
        for(int j = 0;j < sizeof(ss);j++)
        {
            if(ss[j] == ' ')
                break;
            else
                cp[j] = ss[j];
        }
        Normalized << HeadPath << cp << '\n';
    }
    Normalized.close();
    
    cout << "The normalized image list is saved to: /DBoW2/build/" << endl << endl;
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