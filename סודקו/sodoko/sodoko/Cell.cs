using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sodoko
{

    internal class Cell
    {
        int _num;
        int _block;
        public Cell(int num, int block)
        {
            _num = num;
            _block = block;
        }
        public int num { get { return _num; } set { _num = value; } }
        public int block { get { return _block; } set { _block = value; } }

        public override string ToString()
        {
            if (num == 0) return "-";
            return "" + num;
        }
    }
}
