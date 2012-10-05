def phello ; :hello ; end
def phello ; :hello ; end
undef phello
def phello ; :hello ; end
class Chello ; def x ; :hello ;  end ; remove_method(:x); end
class Chello ; def x ; :hello ;  end ; undef_method :x ; end
class Chello ; def x ; :hello ;  end ;  end
Chello.class_eval { remove_method :x }
class Chello ; def x ; :hello ;  end ;  end
Chello.new.x 
Chello.instance_eval { undef_method "x" }
Chello.new.x 
class Chello ; def x ; :hello ;  end ;  end
Chello.class_eval { undef_method "x" }
class Chello ; def self.x ; :hello ;  end ;  end
Chello.x 
Chello.instance_eval { class << self ;remove_method :x; end  }
#Chello.x 
class Chello ; def self.x ; :hello ;  end ;  end
Chello.x 
Chello.class_eval { class << self ;remove_method :x; end  }
class Chello ; def x ; :hello ;  end ;  end
class Xhello < Chello  ; def x ; :hello ;  end ;  end
Xhello.class_eval { remove_method :x }
Xhello.new.x
class Xhello < Chello  ; def x ; :hello ;  end ;  end
Xhello.class_eval { undef_method :x }
#Xhello.new.x
