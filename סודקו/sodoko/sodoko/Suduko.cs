using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TargilToRoei;

namespace sodoko
{
    internal class Suduko
    {
        Cell[,] matrix;
        Set[] rowSet;
        Set[] colSet;
        Set[] blockSet;
        public Suduko()
        {
            Initializaition();
        }

        public bool InsertCell(int val, int row, int col)
        {
            int block = findMyBlockNumber(row, col);
            try
            {
                if (!rowSet[row].isMember(val) && !colSet[col].isMember(val) && !blockSet[block].isMember(val))
                {
                    try
                    {
                        rowSet[row].Insert(val);
                        colSet[col].Insert(val);
                        blockSet[block].Insert(val);
                        if (matrix[row, col] == null) matrix[row, col] = new Cell(val, block);
                        else
                        {
                            int tmpVal = matrix[row, col].num;
                            matrix[row, col].num = val;
                            matrix[row, col].block = findMyBlockNumber(row, col);
                            rowSet[row].Delete(val);
                            colSet[col].Delete(val);
                            blockSet[block].Delete(val);
                        }
                    }
                    catch (Exception ex1)
                    {
                        return false;
                    }
                }
                else
                {
                    Console.WriteLine("\n\nWatch out - illegal input! - this number already exsit in this col/block/row\n\n");
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }

        public bool DeleteCell(int row, int col)
        {
            if (matrix[row, col] == null) return true;
            int block = findMyBlockNumber(row, col);
            int valTodelete = matrix[row, col].num;
            try
            {
                rowSet[row].Delete(valTodelete);
                colSet[col].Delete(valTodelete);
                blockSet[block].Delete(valTodelete);
            }
            catch (Exception ex)
            {
                return false;
            }

            matrix[row, col].num = 0;
            matrix[row, col].block = 0;
            return true;


        }

        private int findMyBlockNumber(int row, int col)
        {
            if (0 <= row && row <= 2)
            {
                if (0 <= col && col <= 2) return 0;
                else if (3 <= col && col <= 5) return 1;
                else return 2;
            }
            else if (3 <= row && row <= 5)
            {
                if (0 <= col && col <= 2) return 3;
                else if (3 <= col && col <= 5) return 4;
                else return 5;
            }
            else
            {
                if (0 <= col && col <= 2) return 6;
                else if (3 <= col && col <= 5) return 7;
                else return 8;
            }
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("     1   2   3   4   5   6   7   8   9\n");
            sb.Append("     *********************************\n");
            for (int i = 0; i < 9; i++)
            {
                sb.Append((i + 1) + "*   ");
                for (int j = 0; j < 9; j++)
                {
                    if (matrix[i, j] == null) sb.Append("-");
                    else { sb.Append(matrix[i, j].ToString()); }
                    sb.Append("   ");
                }
                sb.Append("\n");
            }
            return sb.ToString();
        }

        public bool ItsDone()
        {
            Set set = new Set(1, 2, 3, 4, 5, 6, 7, 8, 9);
            for (int i = 0; i < matrix.Length; i++)
            {
                if (!rowSet[i].Subset(set))
                    return false;
            }
            Console.WriteLine("Well done you manage to solve it correctly!!!");
            return true;
        }


        public void NewGame(string diffculty)
        {
            Initializaition();

            this.InsertCell(8, 0, 0);
            this.InsertCell(2, 0, 5);
            this.InsertCell(1, 0, 8);
            this.InsertCell(7, 1, 0);
            this.InsertCell(6, 1, 4);
            this.InsertCell(9, 2, 0);
            this.InsertCell(7, 2, 3);
            this.InsertCell(8, 2, 4);
            this.InsertCell(5, 3, 0);
            this.InsertCell(8, 3, 1);
            this.InsertCell(9, 3, 2);
            this.InsertCell(4, 3, 6);
            this.InsertCell(4, 4, 2);
            this.InsertCell(5, 4, 5);
            this.InsertCell(7, 5, 2);
            this.InsertCell(4, 5, 4);
            this.InsertCell(8, 5, 5);
            this.InsertCell(3, 5, 8);
            this.InsertCell(2, 6, 3);
            this.InsertCell(3, 6, 5);
            this.InsertCell(7, 7, 1);
            this.InsertCell(8, 7, 2);
            this.InsertCell(2, 7, 6);
            this.InsertCell(3, 7, 7);
            this.InsertCell(5, 8, 2);
            this.InsertCell(8, 8, 3);
            this.InsertCell(9, 8, 6);
            this.InsertCell(6, 8, 7);
            if (diffculty.Equals("hard")) return;
            this.InsertCell(9, 6, 1);
            this.InsertCell(6, 6, 2);
            this.InsertCell(3, 0, 2);
            if (diffculty.Equals("medium")) return;
            this.InsertCell(3, 1, 3);
            this.InsertCell(3, 2, 6);
            this.InsertCell(3, 3, 4);
            this.InsertCell(2, 4, 4);
            this.InsertCell(7, 3, 5);


        }

        private void Initializaition()
        {
            matrix = new Cell[9, 9];
            rowSet = new Set[9];
            colSet = new Set[9];
            blockSet = new Set[9];
            for (int i = 0; i < 9; i++)
            {
                rowSet[i] = new Set();
                colSet[i] = new Set();
                blockSet[i] = new Set();
            }
        }


    }
}


