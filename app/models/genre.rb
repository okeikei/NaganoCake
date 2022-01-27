class Genre < ApplicationRecord
    
    enum name_id: { 登録済ジャンルから選択: 0}#integer型で管理する
end
