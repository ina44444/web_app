# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.delete_all
User.reset_pk_sequence
User.create([

              {name: "Example User", email: "example@railstutorial.org"},
            ])
Image.delete_all
Image.reset_pk_sequence
Image.create([

               {name: 'Париж', file: 'Фото1.jpg', theme_id: 2},
               {name: 'Дубаи', file: 'dubaiLR.jpg', theme_id: 2},
               {name: 'Сидней', file: 'interesnye-fakty-o-sidnee.jpg', theme_id: 2},
               {name: 'Эльбрус', file: 'elbrus_12.jpg', theme_id: 3},
               {name: 'Эверест', file: 'iStock-137373260_d_850.jpg', theme_id: 3},
               {name: 'Маттерхорн', file: '134987.jpg', theme_id: 3},
               {name: 'Хайкинг', file: 'hiking.jpg', theme_id: 4},
               {name: 'Велотуризм',file: 'veloturizm.jpg', theme_id: 4},
               {name: 'Полеты на воздушном шаре',file: 'kappadokia.jpg', theme_id: 4},
               {name: 'Серфинг', file: 'Serfing.jpg', theme_id: 4},
             ])
Theme.delete_all
Theme.reset_pk_sequence
Theme.create([

               {name: '-----'},      # 1 Нет темы
               {name: 'Оцените город'},      # 2
               {name: 'Оцените известность гор'} ,    # 3
               {name: 'Оцените популярность активности'}   # 4
             ])
