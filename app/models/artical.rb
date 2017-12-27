class Artical <ActiveRecord::Base
    validates:title,presence:true,length:{minimum:3,maximum:100}
    validates:description,presence:true,length:{minimum:5,maximum:2000}
end