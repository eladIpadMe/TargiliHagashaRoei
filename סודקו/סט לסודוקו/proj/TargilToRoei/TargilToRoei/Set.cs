using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TargilToRoei
{
    internal class Set
    {

        const int thausandAndOne = 1001;
        const int thausand = 1000;
        const int zero = 0;
       private bool[] _boolSet;
     public Set()
        {
            _boolSet = new bool[thausandAndOne];
        }
     
        public Set(params int[] list) : this()// calling the default constuctor
        {
            
           
            foreach(int x in list)
            {
                if (x < zero && x > thausand) throw new Exception("Value is not in range");
                if(_boolSet[x] == true) throw new Exception("Same value twice");
                _boolSet[x] = true;
            }

        }

        public void Union(Set currSet)
        {
            for(int i = 0; i< _boolSet.Length; i++)
            {
                if (currSet._boolSet[i] == true) 
                    _boolSet[i] = true;
            }
        }

        public void Intersect(Set currSet)
        {
            for (int i = 0; i < _boolSet.Length; i++)
            {
                if (currSet._boolSet[i] == false && this._boolSet[i] == true ) 
                    this._boolSet[i] = false;
            }
        }

        public bool Subset(Set currSet)
        {
            for (int i = 0; i < _boolSet.Length; i++)
            {
                if (currSet._boolSet[i] == true)
                    if (_boolSet[i] == false)
                        return false;
            }
            return true;
        }

        public bool isMember(int num)
        {
            if (num < zero || num > thausand) throw new Exception("Value is out of range!");
            if (_boolSet[num] == true) return true;
            return false;
        }
        

        public void Insert(int num)
        {
            if (num < zero || num > thausand) throw new Exception("Value is out of range!");
            _boolSet[num] = true;
        }

        public void Delete(int num)
        {
            if (num < zero || num > thausand) throw new Exception("Value is out of range!");
            _boolSet[num] = false;
        }

        public override string ToString()
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("Set values: ");
            for(int i=0; i < _boolSet.Length; i++)
            {
                if(_boolSet[i] == true)
                    stringBuilder.Append(i + ", " );
            }
            stringBuilder.Remove(stringBuilder.Length - 2, 2);
            return stringBuilder.ToString();
        }

        public override bool Equals(object? obj)
        {
           if(obj == null) throw new ArgumentNullException(nameof(obj));
           bool[] curr =  (bool[])obj;
            for (int i = 0; i < _boolSet.Length; i++) { 
               if(curr[i] == _boolSet[i]) return false;
            }
            return false;
        }
        public int[] set { get;  set; }
        public bool[] boolSet { get; set; } 

    }

   
}
