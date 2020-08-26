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
      email: 'test1@test.com',
      phone_number: '09012345678',
      password: 'test12',
      password_confirmation: 'test12',
      address: '東京都渋谷区神南1丁目19番11号 パークウェースクエア24階',
      postcode: '1500041',
    },
    {
      last_name: '大和',
      first_name: '隆',
      kana_last_name: 'ヤマト',
      kana_first_name: 'タカシ',
      email: 'test2@test.com',
      phone_number: '0823253017',
      password: 'test12',
      password_confirmation: 'test12',
      address: '広島県呉市宝町5-20',
      postcode: '7370029',
    },
    {
      last_name: '田中',
      first_name: '呉',
      kana_last_name: 'タナカ',
      kana_first_name: 'クレ',
      email: 'test3@test.com',
      phone_number: '0823312432',
      password: 'test12',
      password_confirmation: 'test12',
      address: '広島県呉市西中央２-３-28',
      postcode: '7378505',
    }
  ]
)

Admin.create!(
    [
      {
        email: 'admin1@admin.com',
        password: 'admin12',
        password_confirmation: 'admin12',
      },
      {
        email: 'admin2@admin.com',
        password: 'admin12',
        password_confirmation: 'admin12',
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
      is_active: true,
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
      },
      {
        name: 'クラシックチョコレートケーキ',
        price: '280',
        explanation: 'チョコレートまたはココアパウダーを主要材料に含むケーキである',
        genre_id: 1,
        is_active: true,
      },
      {
        name: 'カスタードプリン',
        price: '150',
        explanation: 'プリン型に牛乳と砂糖を混ぜた卵液を流し込み、加熱してカスタードを凝固させたものである',
        genre_id: 3,
        is_active: true,
      },
      {
        name: 'いちご飴',
        price: '20',
        explanation: 'いちご味の飴',
        genre_id: 3,
        is_active: true,
      },
    ]
  )