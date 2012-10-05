#!/usr/bin/env ruby
# Instance Method Resolution: C->B->A->OBJ->BasicObj 
#
# Class Method Resolution: mC->mB->mObJ->mBasicObj->Class->Module->OBJ
# 	mC stands for Metclass/singletn/eigenclass of Class C
#
# Constant Lookup:  C->EM->IM->B->A->OBJ
#	EM stands for Enclosing Module
#	IM stands for Included  Module
#	Object includes Kernel Module so any constant defined in Kernel Module
#         will come only after constants defined at Top level or global level
#        EM->IM : repeat it for evey class...I have just shown it for one

out=`cat scope_ch7.rb` ; puts out ; print "Press Enter:" ; out1=gets ;
##############

module Kernel
  # Constants defined in Kernel
  A = B = C = D = E = F = "defined in kernel"
end

# Top-level or "global" constants defined in Object
A = B = C = D = E = "defined at toplevel"

class Super
  # Constants defined in a superclass
  A = B = C = D = "defined in superclass"
end

module Included
  # Constants defined in an included module
  A = B = C = "defined in included module"
end

module Enclosing
  # Constants defined in an enclosing module
  A = B = "defined in enclosing module"

  class Local < Super
    include Included

    # Locally defined constant
    A = "defined locally"

    # The list of modules searched, in the order searched
    # [Enclosing::Local, Enclosing, Included, Super, Object, Kernel]
    search = (Module.nesting + self.ancestors + Object.ancestors).uniq

    puts A  # Prints "defined locally"
    puts B  # Prints "defined in enclosing module"
    puts C  # Prints "defined in included module"
    puts D  # Prints "defined in superclass"
    puts E  # Prints "defined at toplevel"
    puts F  # Prints "defined in kernel"
  end
end
