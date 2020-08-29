# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Member.create!(
  [
    {
      last_name: '橋本',
      first_name: '聡太',
      kana_last_name: 'ハシモト',
      kana_first_name: 'ソウタ',
      email: 'test@1.com',
      phone_number: '09012345678',
      password: '123456',
      password_confirmation: '123456',
      prefecture_code: '13',
      address: '渋谷区神南1丁目19番11号 パークウェースクエア24階',
      postcode: '1500041',
    },
    {
      last_name: '佐藤',
      first_name: '隆',
      kana_last_name: 'サトウ',
      kana_first_name: 'タカシ',
      email: 'test@2.com',
      phone_number: '0823253017',
      password: '123456',
      password_confirmation: '123456',
      prefecture_code: '34',
      address: '呉市宝町5-20',
      postcode: '7370029',
    },
    {
      last_name: '田中',
      first_name: '花子',
      kana_last_name: 'タナカ',
      kana_first_name: 'ハナコ',
      email: 'test@3.com',
      phone_number: '0823312432',
      password: '123456',
      password_confirmation: '123456',
      prefecture_code: '34',
      address: '呉市西中央２-３-28',
      postcode: '7378505',
    },
    {
      last_name: '四方',
      first_name: '秀',
      kana_last_name: 'シカタ',
      kana_first_name: 'シュウ',
      email: 'shu.42111227@gmail.com',
      phone_number: '09053601693',
      password: '111111',
      password_confirmation: '111111',
      prefecture_code: '27',
      address: '大阪市淀川区西中島3-14-28',
      postcode: '5320011',
    }
  ]
)

Admin.create!(
  [
    {
      email: 'admin@1.com',
      password: '123456',
      password_confirmation: '123456',
    },
    {
      email: 'admin@2.com',
      password: '123456',
      password_confirmation: '123456',
    }
  ]
)

Genre.create!(
  [
    {
      name: 'ケーキ',
      is_active: true,
    },
    {
      name: 'クッキー',
      is_active: true,
    },
    {
      name: 'プリン',
      is_active: true,
    },
    {
      name: '飴',
      is_active: false,
    }
  ]
)

Item.create!(
  [
    {
      name: 'ショートケーキ',
      price: '200',
      explanation: '日本および西欧にそれぞれあるケーキの種類である、スポンジとクリームが層になって、イチゴなどがのせられたケーキである',
      genre_id: 1,
      is_active: true,
      image: File.open("./app/assets/images/cake1_seed.jpg"),
    },
    {
      name: 'チョコレートケーキ',
      price: '280',
      explanation: 'チョコレートまたはココアパウダーを主要材料に含むケーキである',
      genre_id: 1,
      is_active: false,
      image: File.open("./app/assets/images/cake2_seed.jpg"),
    },
    {
      name: 'モンブラン',
      price: '300',
      explanation: 'クリなどを原料とするクリームを生地の上面に絞りかけたケーキである',
      genre_id: 1,
      is_active: true,
      image: File.open("./app/assets/images/cake3_seed.jpg"),
    },
    {
      name: 'ミルフィーユ',
      price: '240',
      explanation: 'フランス発祥の菓子の一種。 歴史のある菓子であり、形状や製法も様々なものがある',
      genre_id: 1,
      is_active: true,
      image: File.open("./app/assets/images/cake4_seed.jpg"),
    },
    {
      name: 'プレーンクッキー',
      price: '50',
      explanation: '主に小麦を主原料とした小型の焼き菓子の総称である',
      genre_id: 2,
      is_active: false,
      image: File.open("./app/assets/images/cake5_seed.jpg"),
    },
    {
      name: 'ラングドシャ',
      price: '90',
      explanation: 'フランス語で「猫の舌」という意味をもち、ザラザラとした舌触りとホロホロと溶けていくような軽い食感が特徴です',
      genre_id: 2,
      is_active: false,
      image: File.open("./app/assets/images/cake6_seed.jpg"),
    },
    {
      name: 'カスタードプリン',
      price: '150',
      explanation: 'プリン型に牛乳と砂糖を混ぜた卵液を流し込み、加熱してカスタードを凝固させたものである',
      genre_id: 3,
      is_active: true,
      image: File.open("./app/assets/images/cake7_seed.jpg"),
    },
    {
      name: 'プディング',
      price: '140',
      explanation: 'イングランドのヨークシャーで生まれたイギリスの家庭料理のひとつ',
      genre_id: 3,
      is_active: true,
      image: File.open("./app/assets/images/cake8_seed.jpg"),
    },
    {
      name: 'サマープディング',
      price: '330',
      explanation: 'イギリスの菓子。サマーフルーツプディングの名前で呼ばれることもある',
      genre_id: 3,
      is_active: false,
      image: File.open("./app/assets/images/cake9_seed.jpg"),
    },
    {
      name: 'いちご飴',
      price: '20',
      explanation: 'いちご味の飴',
      genre_id: 4,
      is_active: true,
      image: File.open("./app/assets/images/cake10_seed.jpg"),
    },
  ]
)

DeliveryAddress.create!(
  [
    {
      member_id: '2',
      address: '広島県呉市西中央２-３-28',
      postcode: '7370811',
      name: '佐藤梅子',
    }
  ]
)