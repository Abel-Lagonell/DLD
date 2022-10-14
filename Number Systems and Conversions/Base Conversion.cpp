#include <iostream>
#include <cstring>
#include <cmath>
using namespace std;


void hexToDec(char *str, size_t len, int dot){
    for (int i = dot-1; i <= 0;  i--){
        
    }



}

void digitConverter(char *str, size_t len){
    for (int i = 0; i < len -1; i++){
        if(isalnum(str[i])){
            if(isalpha(str[i])){
                if(isupper(str[i])){
                    str[i] -= 52;
                } else {
                    str[i] -= 84;
                }
            }
            else {
                str[i] -= 48;
            }
        }
    }
}

int main(){
    char str[11] = "0123A.Cabc";

    size_t len = sizeof(str)/sizeof(str[0]);



    digitConverter(str, len);

    for (int i = 0; i < len -1; i++){
        if (int(str[i]) == 46) cout << '.' << endl;
        else cout <<  int(str[i]) << endl; // 46 is .
    }
    
    
    return 0;
}