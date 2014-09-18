//Project 1 CIS247C
//Created by Julian Barber
#include "stdafx.h"
#include <iostream>
#include <string>
#include <fstream>
#include <iomanip>
#include <conio.h>

using namespace std;

//Functions
void Heading();

int main()
{
	char ch;
	string strDistrict_No, strCounty_No, strCity_No, strAccount_No, strFiller_1, strFiller_2, AccountName;
	string old_District,old_County,old_City,old_Account;
	int subtotal=0, total=0;
	
	cout << endl << fixed << setprecision(2);

	ifstream inFile;
	inFile.open("FBRK.TXT", ios::in);

	Heading();
	
	if (inFile.is_open())
	{
		getline(inFile, strDistrict_No, ',');
		getline(inFile, strCounty_No, ',');
		getline(inFile, strCity_No, ',');
		getline(inFile, strFiller_1, ',');
		getline(inFile, strAccount_No, ',');
		getline(inFile, strFiller_2, '\n');
	
		old_District = strDistrict_No;
		old_County = strCounty_No;
		old_City = strCity_No;
		old_Account = strAccount_No;
		int county_total =0;
		int district_total = 0;
		int city_total = 0;
		int account_total = 0;
		float district_Counter = 0.0;
		float city_Counter = 1;
		float county_Counter = 1;
		
		while (!inFile.eof())
		{
			int AccountName_In = stoi(strAccount_No.c_str());
			int bond;

			switch(AccountName_In)
			{
			case 1:
				AccountName =  "HIGHWAY CONSTRUCTION   ";
				bond = 300000;
				break;
			case 2:
				AccountName =  "PARKS & RECREATION     ";
				bond = 270000;
				break;
			case 3:
				AccountName =  "MENTAL HEALTH          ";
				bond = 150000;
				break;
			case 4:
				AccountName =  "SCEONDARY SCHOOLS      ";
				bond = 450000;
				break;
			case 5:
				AccountName =  "COLLEGE & UNIVERSITY   ";
				bond = 325000;
				break;
			case 6:
				AccountName =  "POLICE - FIRE          ";
				bond = 450000;
				break;
			default:;
			}//endSwitch			

			if (old_District != strDistrict_No)
			{								
				cout << "\n               City      #"<< old_City << "   TOTAL             " << city_total << "*" << endl;
				cout << endl;
				old_City = strCity_No;
				city_total = 0;
				cout << "\n               COUNTY    #"<< old_County << "   TOTAL             " << county_total << "**" << endl;
				cout << endl;
				old_County = strCounty_No;
				county_total = 0;	
				cout << "\n               DISTRICT  #"<< old_District << "   TOTAL             " << district_total << "***" << endl;
				cout << endl;
				old_District = strDistrict_No;
				total = district_total + total;
				district_total = 0;	
				district_Counter=0;
			}//end of if loop
			
			if(old_County != strCounty_No)
			{
				cout << "\n               City      #"<< old_City << "   TOTAL             " << city_total << "*" << endl;
				old_City = strCity_No;
				city_total = 0;
				cout << "\n               COUNTY    #"<< old_County << "   TOTAL             " << county_total << "**" << endl;
				cout << endl;
				old_County = strCounty_No;
				county_total = 0;
				county_Counter=0;
			}//end of if loop
			
			if(old_City != strCity_No)
			{
				cout << "\n               City      #"<< old_City << "   TOTAL             " << city_total << "*" << endl;
				cout << endl;
				old_City = strCity_No;
				city_total = 0;
				city_Counter=0;
			}//end of if loop

			//flags for final control break
			if (district_Counter == 0)
			{
				cout << strDistrict_No << "        " << strCounty_No << "      " << strCity_No << "      " << strAccount_No << "          " << AccountName << "      " << bond << endl;
				district_Counter++;
			}			
			else
			if (city_Counter == 0)
			{
				cout << "                  " << strCity_No << "      " << strAccount_No << "          " << AccountName << "      " << bond << endl;
				city_Counter++;
			}			
			else
			if (county_Counter == 0)
			{
				cout << "          " << strCounty_No << "      " << strCity_No << "      " << strAccount_No << "          " << AccountName << "      " << bond << endl;
				county_Counter++;
			}			
			else
			
			cout << "                          " << strAccount_No << "          " << AccountName << "      " << bond << endl;
				
			//Total counters
			district_total = district_total + bond;
			county_total = county_total + bond;
			city_total = city_total + bond;
			total = total + bond;
				
			//get next line
			getline(inFile, strDistrict_No, ',');
			getline(inFile, strCounty_No, ',');
			getline(inFile, strCity_No, ',');
			getline(inFile, strFiller_1, ',');
			getline(inFile, strAccount_No, ',');
			getline(inFile, strFiller_2, '\n');			

		}//end of while
		
		cout << "\n             City         #"<< old_City << "    TOTAL             " << city_total << "*" << endl;
		cout << "\n             COUNTY       #"<< old_County << "    TOTAL             " << county_total << "**" << endl;
		cout << "\n             DISTRICT     #"<< old_District << "    TOTAL             " << district_total << "***" << endl;
		cout << "\n             Final         "<< "      TOTAL             " << total << "****"<< endl;
		inFile.close();
	}//end of if 
	else
	cout << "Could not read the file\n";

system("PAUSE");
ch = _getch();
return 0;
}

void Heading()
{
	cout << "                              Proposed Bond issues" << endl;
	cout << "  " << endl;
	cout << "DISTRICT  COUNTY  CITY    ACCOUNT    ACCOUNT                      BOND" <<endl;
	cout << "NUMBER    NUMBER  NUMBER  NUMBER     NAME                         AMOUNT" << endl;
	cout << "   "  << endl;
}



