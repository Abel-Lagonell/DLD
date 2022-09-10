#include <iostream>
#include <cstring>
#include <string>
using namespace std;

//Gets the digit from the string 
int digGetter(string str, int i) {
	double d = stod(str);
	int x, y, n=0;


	if (i == 0) {
		cout << "Digit is not possible" << endl;
		return -1;
	}
	else if (i < 0) {
		//Sets it so that the one's Digit is the decimal place we want
		d *= pow(10, -i);
		i =1;
	}

	//X is the number that has the digit, Y has the rest of the higher order digits.
	x = pow(10, i - 1) * floor(d / (pow(10, i - 1)));
	y = pow(10, i) * floor(d / (pow(10, i)));
	//N gets the digit
	n = (x - y) / pow(10, i - 1);

	return n;
	//get a certain digit given place in int relative to left most digit
}

//Returns the number of digits in the strin before decimal point
int digits(string str) {
	int len = str.length();
	int count = 0;
	
	for (int i = 0; i <= len; i++) {
		if (str[i] == '.' || str[i] == '\0')
			return count;
		count++;
	}
}

//Returns the number of digits after decimal point
int decimals(string str) {
	int len = str.length();
	int count = 0;
	
	for (int i = len-1; i >= 0; i--) {
		if (str[i] == '.')
			return count;
		count++;
	}
	
	return 0;
}

//int binary to Decimal Currently cannot do more than nine as base
double baseToDecimal(string str, int base) {

	int len = str.length();
	double dec_value = 0;
	int digit = digits(str);
	int decimal = decimals(str);
	
	if (base < 2 || base > 9) {
		cout << "Not valid Base" << endl;
		return 0;
	}

	for(int i = 0; i < digit; i++){
		if (str[i] == '.')
			break;
		dec_value += digGetter(str,digit-i) * (pow(base, digit - i - 1));

	}

	if (decimal > 0) {
		for (int i = digit + 1; i < len; i++) {
			dec_value += digGetter(str, digit - i) / (pow(base, len - i));
		}
	}

	return dec_value;
}

double decimalToBase(string str, int base) {

	double base_value = 0;
	double n = stod(str), m = stod(str);
	int digit = digits(str);
	int decimal = decimals(str);

	

	return base_value;
}

int main() {
	string str = "33";
	int base = 4;
	

	double bin = baseToDecimal(str,base);

	cout << "Base " << base << " :" << str << endl;
	cout << "Decimal: " << bin << endl;

	return 0;
}