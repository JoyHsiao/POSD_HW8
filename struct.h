#ifndef STRUCT_H
#define STRUCT_H

#include "atom.h"
#include <vector>
#include <string>

using std::string;

class Struct:public Term
{
public:
  Struct(Atom const & name, std::vector<Term *> args):_name(name), _args(args) {
  }

  Term * args(int index) {
    return _args[index];
  }

  Atom & name() {
    return _name;
  }
  string symbol(){
    return _name.symbol() + "(" + _args[0]-> symbol()+ ", "+_args[1]-> symbol() +")";
  }
private:
  Atom _name;
  std::vector<Term *> _args;
};

#endif
