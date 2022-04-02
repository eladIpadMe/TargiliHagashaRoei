// See https://aka.ms/new-console-template for more information
using TargilToRoei;

Set set1 = new Set();
Set set2 = new Set();

Set set3 = new Set();
Set set4 = new Set();

try// just to try this consturctor
{
    Set set7 = new Set(1, 1, 3, 4);
}
catch (Exception ex) { }

Generator(set1);
Generator(set2);
Generator(set3);
Generator(set4);

Console.WriteLine("set1 is: " + "\n" + set1.ToString());
Console.WriteLine("set2 is: " + "\n" + set2.ToString());


set1.Union(set2);
Console.WriteLine("\n" + "set1 is (after union): " + "\n" + set1.ToString());
Console.WriteLine("\n");
Console.WriteLine("\n");


Console.WriteLine("set3 is: " + "\n" + set3.ToString());
Console.WriteLine("set4 is: " + "\n" + set4.ToString());
set3.Intersect(set4);
Console.WriteLine("\n" + "set3 is (after intersect): " + "\n" + set3.ToString());

Set set5 = new Set();
int cur;
object obj;
for(int i=0; i<3; i++)
{
    Console.WriteLine("Please enter number " + (i+1));
     obj = Console.ReadLine();
    try {
        cur = int.Parse(obj.ToString());
        set5.Insert(cur); }
    catch (Exception ex) { }
 }


Console.WriteLine(set1.Subset(set5));

Console.WriteLine("set5 is: " + "\n" + set5.ToString());
Console.WriteLine("\n");
try {Console.WriteLine(set1.isMember(15));
Console.WriteLine(set2.isMember(45));
Console.WriteLine(set3.isMember(90));
Console.WriteLine(set4.isMember(134)); }
catch (Exception ex) { }    


Console.WriteLine("Please enter number to insert to all sets");

obj = Console.ReadLine();
cur = int.Parse(obj.ToString());
try { set1.Insert(cur);
    set2.Insert(cur);
    set3.Insert(cur);
    set4.Insert(cur);
    set5.Insert(cur);}
catch (Exception ex) { }   


Console.WriteLine("set1 is: " + "\n" + set1.ToString());
Console.WriteLine("set2 is: " + "\n" + set2.ToString());
Console.WriteLine("set3 is: " + "\n" + set3.ToString());
Console.WriteLine("set4 is: " + "\n" + set4.ToString());
Console.WriteLine("set5 is: " + "\n" + set5.ToString());

Console.WriteLine("Please enter number to delete from set1 and set2");
obj = Console.ReadLine();
cur = int.Parse(obj.ToString());
try { set1.Delete(cur);
set2.Delete(cur);}
catch (Exception ex) { }    


Console.WriteLine("set1 is: " + "\n" + set1.ToString());
Console.WriteLine("set2 is: " + "\n" + set2.ToString());


static void Generator(Set set)
{
    Random rnd = new Random();
    int num;
    for (int i = 0; i < 13; i++)
    {
        num = rnd.Next(0, 1001);
        try {  set.Insert(num);}
        catch (Exception) {}
    }  
}






//Set set5 = new Set(1,2,3,4);
//Set set6 = new Set(3,4,5,6);
//set5.Intersect(set6);
//Console.WriteLine("\n" + "set3 is (after intersect): " + "\n" + set3.ToString());



