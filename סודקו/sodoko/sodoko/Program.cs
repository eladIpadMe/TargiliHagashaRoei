// See https://aka.ms/new-console-template for more information
using sodoko;

Suduko sud = new Suduko();
LetsStart(sud);


string step = "5";
while (!step.Equals("1") && !step.Equals("2") && !step.Equals("3") && !step.Equals("4"))
{
    Console.WriteLine("Here is your borad:\n\n" + sud.ToString());
    Console.WriteLine("\n\nFor value insertion press: 1\nFor deleting value press: 2\nFor starting a new game press: 3 \nFor quiting press: 4");
    step = Console.ReadLine();
    int val, row, col;
    bool correctInsertion = false;
    if (step.Equals("1"))
    {
        Console.WriteLine("Please insert value between 1-9 to be inserted to the board or 0 to start a new game:");
        val = UserInputCheck();
        if (val == 0) step = "3";
        else
        {
            Console.WriteLine("Please insert a row number between 1-9 where you want your value to be inserted or 0 to start a new game:");
            row = UserInputCheck();
            if (row == 0) step = "3";
            else
            {
                Console.WriteLine("Please insert a col number between 1-9 where you want your value to be inserted or 0 to start a new game:");
                col = UserInputCheck();
                if (row == 0) step = "3";
                else
                {
                    sud.InsertCell(val, row - 1, col - 1);
                    if (sud.ItsDone())
                    {
                        sud = new Suduko();
                        LetsStart(sud);
                        step = "5";
                    }
                }
            }
        }
        step = "5";
    }
    else if (step.Equals("2"))
    {
        Console.WriteLine("Please insert a row number between 1-9 where you want your value to be deleted or 0 to start a new game:");
        row = UserInputCheck();
        if (row == 0) step = "3";
        else
        {
            Console.WriteLine("Please insert a col number between 1-9 where you want your value to be deleted or 0 to start a new game:");
            col = UserInputCheck();
            if (row == 0) step = "3";
            else sud.DeleteCell(row - 1, col - 1);
        }
        step = "5";

    }
    else if (step.Equals("3"))
    {
        sud = new Suduko();
        LetsStart(sud);
        step = "5";
    }
    else if (step.Equals("4")) Environment.Exit(0);
    else
    {
        Console.WriteLine("Incorrect insertion");
    }
}



static int UserInputCheck()
{
    bool correctInsertion = false;
    string num;
    while (!correctInsertion)
    {
        num = Console.ReadLine();
        if (num.Equals("0") || num.Equals("1") || num.Equals("2") || num.Equals("3") || num.Equals("4") || num.Equals("5") || num.Equals("6") || num.Equals("7") || num.Equals("8") || num.Equals("9"))
        {
            correctInsertion = true;
            return int.Parse(num);
        }
        else
        {
            Console.WriteLine("Incorrect insertion - try again...");
        }

    }
    return 0;
}

static void LetsStart(Suduko sud)
{
    Console.WriteLine("Wellcome to Suduko Game!!! \n\nLet's start playing\n");
    Console.WriteLine("Please choose the diffculty you want - press 1 for easy, 2 for medium or 3 for hard:");
    string diffculty = Console.ReadLine();
    while (!diffculty.Equals("1") && !diffculty.Equals("2") && !diffculty.Equals("3"))
    {
        Console.WriteLine("Incorrect insertion");
        Console.WriteLine("Please choose the diffculty you want - press 1 for easy, 2 for medium and 3 for hard.");
        diffculty = Console.ReadLine();
    }
    if (diffculty.Equals("1")) sud.NewGame("easy");
    else if (diffculty.Equals("2")) sud.NewGame("medium");
    else sud.NewGame("hard");
}