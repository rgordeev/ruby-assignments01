## Задание 5: Основы работы с Ruby on Rails

### Приступая к работе

1. Создайте новое приложение rails `todolists`.

2. Добавьте следующие объявления в `Gemfile`, чтобы подключить `rspec`.

    ```ruby
    group :test do
      gem 'rspec-rails', '~> 3.0'
    end
    ```
3. Выполните команду `bundle` для разрешения новых зависимостей.

4. Из корневой директории проекта `todolists` проинициализируйте `rspec` тесты, используя команду 
  `rails generate rspec:install`.

    ```shell
      [todolists]$ rails generate rspec:install
      create  .rspec
      create  spec
      create  spec/spec_helper.rb
      create  spec/rails_helper.rb
    ```

    Добавьте следующую строку в `.rspec` для отображения вывода результатов тестов.

    ```shell
    --format documentation
    ```

5. Скачайте из репозитория следующие файлы. 

    ```shell
    |-- Gemfile
    |-- assignment
    |   `-- assignment.rb
    `-- spec
        `-- assignment_spec.rb
        `-- relations_assignment_spec.rb
    ```
    * замените ваш `Gemfile` файлом из репозитория.

    * создайте директорию `assignment` в корне вашего приложения и скопируйте туда 
    файл `assignment/assignment.rb`. В этом файле необходимо будет реализовать методы, 
    имплементирующие требования задания.
        
    * скопируйте в диреторию `spec` вашего приложения файлы `spec/assignment_spec.rb` и 
    `spec/relations_assignment_spec.rb`, содержащие тесты,
    контролирующие выполнение задания.
    
6. Запустите тесты, чтобы инициировать начальную проверку приложения. `rspec` следует запустить 
из корня вашего приложения. Пока вы не выполните задание, вы будете получать сообщения об ошибках.       

    ```shell
    $ rspec 
    ...
    Finished in 0.02069 seconds (files took 1.63 seconds to load)
    52 examples, 1 failure, 50 pending
    ```
    
    Чтобы получить результаты выполнения конкретного теста, используйте ключ "-er ##" команды
    `rspec` в строке терминала.  
    
    ```shell
    $ rspec spec/assignment_spec.rb -e rq01
    Run options: include {:full_description=>/rq01/}

    Assignment
      rq01
        Generate Rails application
          must have top level structure of a rails application

    Finished in 0.00465 seconds (files took 1.56 seconds to load)
    1 example, 0 failures
    ```
7. Создайте модели и реализуйте методы в файле `assignment.rb`, а затем проверьте результат,
выполнив `rspec` тесты.

8. Создайте pull request на репозиторий `https://github.com/rgordeev/ruby-assignments01` для оценки задания.

### Технические требования

1. Создайте новое Rails приложение `todolists`. 

    ```shell
    $ rspec spec/assignment_spec.rb -e rq01
    ```

   Примечание: Используйте Gemfile из репозитория. 
   Пользователям Windows потребуется добавить в Gemfile следующие зависимости:

   ```ruby
   # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
   gem 'tzinfo-data', platforms: [:mingw, :mswin]
   ```

2. Создайте генератором 4 класса модели, имеющие определенные поля, и соответствующие 
миграции БД, используя команду `rails generate` 
    
    Можно отдельно оценивать выполнение каждой части задания по созданию моделей и соответствующих
    миграций БД, запуская `rspec` тесты, перечисленные после каждого класса. Например,
    
    ```shell
    $ rake db:migrate
    $ rspec spec/assignment_spec.rb -e rq02.1
    ```
    
    1. User (`rq02.1`)

        - username - строка, содержащая логин пользователя
        - password_digest - строка с паролем пользователя
    
    2. Profile (`rq02.2`)
    
        - gender - строка, содержащая значения "male" или "female"
        - birth_year - число, соответствующее году рождения пользователя
        - first_name - строка, имя пользователя
        - last_name - строка, фамилия пользователя
    
    3. TodoList (`rq02.3`)
        
        - list_name - строка, имя пользователя, ассоциированного с листом дел
        - list_due_date - дата, к которой элементы TODO листа должны быть выполнены
        Тип данного поля - дата. На не заботит время внутри дня.
    
    4. TodoItem (`rq02.4`)
        
        - due_date - дата, к которой должно быть выполнено задание
        - title - строка, содержащая имя отдельного задания
        - description - текст, описывающий детали задания
        - completed - булево значение (по умолчанию=false), указывающее выполнено ли задание

3. Добавление записей в БД

    1. Реализуйте метод `create_user` в файле `assignment/assignment.rb`, который  

        * принимает карту из свойств пользователя (`:username` и `:password_digest`). 
        * использует класс модели `User` для создания нового пользователя в БД.
        * возвращает экземпляр класса `User` с проинициализированными первичным ключом (`id`) и датами (`created_at` и `updated_at`).
    
        ```script
        $ rspec spec/assignment_spec.rb -e rq03.1
        ```

    2. Реализуйте метод `create_todolist` в файле `assignment/assignment.rb`, который

        * принимает карту с полями (`:name` и `:due_date`). 
        * использует модель `TodoList` для создания нового элемента `todolist` в БД.
        * возвращает экземпляр класса `TodoList` с инициализированными первичным ключом (`id`) и датами (`created_at` и `updated_at`).
        
        ```script
        $ rspec spec/assignment_spec.rb -e rq03.2
        ```

4. Получение записей из БД, разбитых на страницы

    1. Реализовать метод `find_allusers` в файле `assignment/assignment.rb`, который 

        * принимает смещение `offset` и количество `limit` как входные параметры
        * использует класс модели `User` для поиска всех пользователей, упорядоченных по `updated_at` 
        по возрастанию, учитывая `offset` и `limit`
        * возвращает коллекцию экземпляров `User`, соответствующих выбранной странице
    
        ```script
        $ rspec spec/assignment_spec.rb -e rq04.1
        ```
    
    2. Реализуйте метод `find_alllists` в файле `assignment/assignment.rb`, который 

        * принимает смещение `offset` и количество `limit` как входные параметры
        * использует класс модели `TodoList` для поиска всех элементов `TodoList`, упорядоченных по 
        `list_due_date` по убыванию, учитывая `offset` и `limit`
        * возвращает коллекцию экземпляров `TodoList`, соответствующих выбранной странице
    
        ```script
        $ rspec spec/assignment_spec.rb -e rq04.2
        ```

5. Запрос к БД по точному соответствию

    1. Реализуйте метод `find_user_byname` в файле `assignment/assignment.rb`, который 

        * принимает на вход имя пользователя `username`
        * использует класс модели `User` для поиска всех пользователей, с соответствующим полем `username`. 
        Заметьте, что до сих пор мы не накладывали ограничение уникальности на username. 
        * возвращает коллекцию экземпляров `User`, соответствующих указанному `username`
    
        ```script
        $ rspec spec/assignment_spec.rb -e rq05.1
        ```
    
    2. Реализуйте метод `find_todolist_byname` в файле `assignment/assignment.rb`, который 

        * принимает значение атрибута `name`
        * использует класс модели `TodoList` для поиска всех элементов `TodoList` с подходящими `list_name`.
        Заметьте, что на атрибут `list_name` не накладывается ограничение уникальности.
        * возвращает коллекцию экземпляров `TodoList`, соответствующих указанному `list_name`
    
        ```script
        $ rspec spec/assignment_spec.rb -e rq05.2
        ```

6. Получение записей из БД по первичному ключу

    1. Реализуйте метод `get_user_byid` в файле `assignment/assignment.rb`, который 

        * принимает на вход параметр `id`
        * использует класс модели `User` для поиска всех пользователей, с соответствующим полем `id`
        * возвращает коллекцию экземпляров `User`, соответствующих указанному `id`
    
        ```script
        $ rspec spec/assignment_spec.rb -e rq06.1
        ```

    2. Реализуйте метод `get_todolist_byid` в файле `assignment/assignment.rb`, который 

        * принимает на вход параметр `id`
        * использует класс модели `TodoList` для поиска всех элементов `TodoList` с подходящим первичным ключом `id`
        * возвращает коллекцию экземпляров `TodoList`, соответствующих указанному `id`
    
        ```script
        $ rspec spec/assignment_spec.rb -e rq06.2
        ```

7. Обновление записей в БД

    1. Реализовать метод `update_password` в файле `assignment/assignment.rb`, который 

        * принимает параметры `id` и `password_digest`
        * использует класс модели `User`, чтобы обновить `password_digest` у пользователя `User`, имеющего идентификатор `id` первичного ключа
    
        ```script
        $ rspec spec/assignment_spec.rb -e rq07.1
        ```

    2. Реализовать метод `update_listname` в файле `assignment/assignment.rb`, который 

        * принимает параметры `id` и `name` 
        * использует класс модели `TodoList`, чтобы обновить `list_name` у экземпляра `TodoList`, имеющего идентификатор `id` первичного ключа 
    
        ```script
        $ rspec spec/assignment_spec.rb -e rq07.2
        ```

8. Удаление записей из БД

    1. Реализовать метод `delete_user` в файле `assignment/assignment.rb`, который 

        * принимает параметр `id`
        * использует класс модели `User`, чтобы удалить экземпляр `User`, имеющий идентификатор `id` первичного ключа
    
        ```script
        $ rspec spec/assignment_spec.rb -e rq08.1
        ```

    2. Реализовать метод `delete_todolist` в файле `assignment/assignment.rb`, который 

        * принимает параметр `id` 
        * использует класс модели `TodoList`, чтобы удалить экземпляр `TodoList`, имеющий идентификатор `id` первичного ключа
    
        ```script
        $ rspec spec/assignment_spec.rb -e rq08.2
        ```
 
9. Все задания из пунктов 1-8 являются минимальным набором, необходимым для получения отметки "зачтено". Для получения более высокого балла необходимо реализовать функционал приложения, описанный в отдельном spec файле `relations_assignment_spec.rb`, при этом не должны пострадать тесты, описанные в `assignment_spec.rb`, то есть при запуске команды 
  ```script
  $ rspec
  ```
должно появиться сообщение об успешном выполнении всех тестов.

### Самооценка

Чтобы проверить задание, выполните следующую команду в корне приложения

```shell
$ rspec 
...
Finished in 3.39 seconds (files took 1.47 seconds to load)
52 examples, 0 failures
```

Также можно запустить тест для конкретного задания, выполнив команду `rspec` с ключом `-e rq## -e rq##`

```shell
$ rspec spec/assignment_spec.rb -e rq01 -e rq02
```

### Pull request

Добавьте в индекс коммита следующие файлы и директории и создайте pull request на 
репозиторий `https://github.com/rgordeev/ruby-assignments01` 

```text
|-- app
|   |-- assets
|   |-- controllers
|   |-- helpers
|   |-- mailers
|   |-- models
|   `-- views
|-- assignment
|   `-- assignment.rb
|-- bin
|-- config
|-- config.ru
|-- db
|-- Gemfile
|-- Gemfile.lock
|-- lib
|-- log
|-- public
|-- Rakefile
|-- README.rdoc
|-- test
`-- vendor
```
