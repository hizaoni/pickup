class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '文房具' },
    { id: 3, name: '保護具' },
    { id: 4, name: 'オイルシール' },
    { id: 5, name: 'ベアリング' },
    { id: 6, name: 'Oリング' },
    { id: 7, name: 'ガスケット' },
    { id: 8, name: 'ホースバンド' },
    { id: 9, name: 'ビニール袋' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end