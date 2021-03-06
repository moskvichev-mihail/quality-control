// triangle.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//

#include "pch.h"
#include <exception>
#include <iostream>
#include <string>
#include <functional>

using namespace std;

class Triangle
{
public:
	Triangle(double a, double b, double c):a(a), b(b), c(c), type(SIMPLE)
	{
		if (!isValid())
		{
			throw invalid_argument("The shape isn't triangle");
		}
		type = SelectType();
	}

	bool isValid()
	{
		return ((a + b > c) && (a + c > b) && (b + c > a));
	}

	string getType()
	{
		return type;
	}

private:
	string SelectType()
	{
		if ((a == b) && (b == c))
		{
			return EQUILATERAL;
		}
		if ((a == b) || (b == c) || (c == a))
		{
			return ISOSCELES;
		}
		return SIMPLE;
	}

	double a, b, c;
	string type;
	static string ISOSCELES, EQUILATERAL, SIMPLE;
};

string Triangle::ISOSCELES = string("Isosceles triangle");
string Triangle::EQUILATERAL = string("Equilateral triangle");
string Triangle::SIMPLE = string("Simple triangle");

string Replace(const string & inputStr, const string & searchStr, const string & replacementStr)
{
	if (searchStr.empty())
	{
		return inputStr;
	}
	string resultStr;
	size_t initSearchPos = 0;

	while (initSearchPos != string::npos)
	{
		auto foundPos = inputStr.find(searchStr, initSearchPos);
		resultStr.append(inputStr, initSearchPos, foundPos - initSearchPos);
		if (foundPos != string::npos)
		{
			resultStr.append(replacementStr);
			foundPos += searchStr.size();
		}
		initSearchPos = foundPos;
	}
	return resultStr;
}

double getSide(const string& str)
{
	try
	{
		string digit(Replace(str, ",", "."));
		auto result = stod(digit);
		return result;
	}
	catch (invalid_argument& exception)
	{
		(void)&exception;
		throw invalid_argument("The '" + str + "' isn't double.");
	}
}

Triangle getTriangle(char* sides[])
{
	auto a = getSide(string(sides[1]));
	auto b = getSide(string(sides[2]));
	auto c = getSide(string(sides[3]));
	return Triangle(a, b, c);
}

string doExecute(int argc, char* argv[])
{
	if (argc != 4)
	{
		throw invalid_argument("Error: invalid arguments count\nUsage: triangle.exe <sideA> <sideB> <sideC>");
	}
	auto triangle = getTriangle(argv);
	return triangle.getType();
}

int main(int argc, char* argv[])
{
	try
	{
		cout << doExecute(argc, argv) << endl;
	}
	catch (exception& exception)
	{
		cout << exception.what() << endl;
		return 1;
	}
	return 0;
}

// Запуск программы: CTRL+F5 или меню "Отладка" > "Запуск без отладки"
// Отладка программы: F5 или меню "Отладка" > "Запустить отладку"

// Советы по началу работы 
//   1. В окне обозревателя решений можно добавлять файлы и управлять ими.
//   2. В окне Team Explorer можно подключиться к системе управления версиями.
//   3. В окне "Выходные данные" можно просматривать выходные данные сборки и другие сообщения.
//   4. В окне "Список ошибок" можно просматривать ошибки.
//   5. Последовательно выберите пункты меню "Проект" > "Добавить новый элемент", чтобы создать файлы кода, или "Проект" > "Добавить существующий элемент", чтобы добавить в проект существующие файлы кода.
//   6. Чтобы снова открыть этот проект позже, выберите пункты меню "Файл" > "Открыть" > "Проект" и выберите SLN-файл.
