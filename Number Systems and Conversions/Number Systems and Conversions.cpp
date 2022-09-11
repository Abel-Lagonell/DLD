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

//int base to Decimal Currently cannot do more than nine as base
double baseToDecimal(string str, int base) {

	int len = str.length();
	double dec_value = 0;
	int l = digits(str); // *l*eftside of decimal point
	int r = decimals(str); // *r*ightside of decimal point
	
	if (base < 2 || base > 9) {
		cout << "Not valid Base" << endl;
		return 0;
	}

	for(int i = 0; i < l; i++){
		if (str[i] == '.')
			break;
		dec_value += digGetter(str,l-i) * (pow(base, l - i - 1));

	}

	if (r > 0) {
		for (int i = l + 1; i < len; i++) {
			dec_value += digGetter(str, l - i) / (pow(base, len - i));
		}
	}

	return dec_value;
}

//double Decimal to base, currently cannot do more than nine as base
double decimalToBase(string str, int base) {

	double base_value = 0;
	double fraction = stod(str);
	int whole = stod(str);
	int l = digits(str);
	int r = decimals(str);
	int len = str.length();
	int i = 0;

	fraction -= whole;

	if (base < 2 || base > 9) {
		cout << "Not valid Base" << endl;
		return 0;
	}

	i = 0;
	while(whole != 0) {
		base_value += fmod(whole,base) * pow(10,i);
		whole = floor(whole/base);
		i++;
	}

	i = 0;
	if (r > 0) {
		while (fraction != (int)fraction && i<=100) {
			base_value += floor(base * fraction) * pow (10,-(i+1));
			fraction = (base * fraction) - floor(base * fraction);
			i++;
		}
	}

	return base_value;
}

//Uses both functions to transfer from base to base
double baseToBase(string str, int base1, int base2) {
	
	double dec = baseToDecimal(str, base1);
	double base = decimalToBase(to_string(dec), base2);

	return base;
}

int main() {
	string str;
	char ans;
	int base1 = 2, base2 = 3, num;
	double bin;
	
	cout << "How many bases and is the original number from base 10? seperated by an ENTER" << endl;
	cin >> num >> ans;

	switch (ans) {
	case 'y':
	case'Y':
		cout << "Please enter the number followed by the base seperated by an ENTER" << endl;
		cin >> str >> base1;

		bin = decimalToBase(str,base1);

		cout << "Bases: " << base1 << endl;
		break;
	case 'n':
	case 'N':
		switch (num) {
		case (2):
			cout << "Please enter the number followed by the two bases seperated by an ENTER" << endl;
			cin >> str >> base1 >> base2;

			bin = baseToBase(str, base1, base2);

			cout << "Bases: " << base1 << ", " << base2 << endl;
			break;

		case (1):
			cout << "Please enter the number followed by the base seperated by an ENTER" << endl;
			cin >> str >> base1;

			bin = decimalToBase(str, base1);

			cout << "Bases: " << base1 << endl;
			break;
		
		default:
			cout << "Cannot have more than two bases" << endl;
		}
		break;

	default:
		cout << "Please input Y/N" << endl;
	}
	
	cout << "OG number: " << str << endl;
	cout << "Final: " << bin << endl;

	return 0;
}