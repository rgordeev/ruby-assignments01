## Задание 4: Food 2 Fork HTTP API Interface

Цель задания - реализовать источник даннх для дальнейшего его использования в модели MVC приложения.

Функциональная цель задания - реализовать RESTful-подобный API клиент для `http://food2fork.com/about/api`, 
возвращающий JSON документы, содержащие информацию о рецептах.

### Функциональные требования

1. Реализовать ruby класс, который 

    * принимает ключевое слово для поиска
    * передает ключевое слово внешнему сервису `http://food2fork.com/about/api`, используя `HTTParty API`
    * возвращает JSON документ, содержащий информацию о рецептах, предоставленную сервисом `http://food2fork.com/about/api`

### Приступая к работе

1. Зарегистрируйтесь на сервисе Food 2 Fork по адресу `http://food2fork.com/about/api`. Бесплатный аккаунт позволяет вам получать до 500 рецептов в день.
   После того, как вы зарегистрируетесь, перейдите на страницу "API Admin" и скорируйте значение поля "API Key".
     * Определите переменную окружения `FOOD2FORK_KEY` и поместите в нее скопрированное значение "API Key"
     
2. Клонируйте репозиотрий и перейдите в папку задания

    ```shell
    --- student-start
      |-- .rspec (important hidden file)
      |-- chocolate_recipes.json
      |-- assignment04-solution.rb
      |-- solution.rb
      `-- spec
          |-- recipe_spec.rb
          `-- spec_helper.rb
    ```
    
    * .rspec - конфигурационный файл unit тестов, не изменяйте его.
    * assignment04-solution.rb - файл, содержащий заглушку решения.
    Вы должны поместить свое решение в этот файл.
    * spec - директория содержит тесты для проверки вашего решения. Вы не должны
    изменять что-либо в этой директории.
    * chocolate_recipes.json - набор данных для unit-тестов.

3. Установите следующие `gem`, необходимые для выполнения тестов.
Последний из них используется для создания `mock` объектов `http` соединения.

    ```shell
    $ gem install rspec
    $ gem install rspec-its
    $ gem install webmock
    ```

4. Внимательно ознакомтесь с документацией Food2Fork и HTTParty.

    * HTTParty API документация расположена здесь `https://github.com/jnunemaker/httparty`
    * Food2Fork описание интерфейсов можно найти по адресу `http://food2fork.com/about/api`

4. Реализуйте класс ruby в файле `assignment04-solution.rb`.

5. Запустите тесты. При первом запуске тесты выдадут информацию об ошибках.

    ```shell
    $ rspec

    Recipe
      should respond to #for (FAILED - 1)
      Environment variable FOOD2FORK_KEY is set (FAILED - 2)
      default_params[:key] equals Environment variable FOOD2FORK_KEY (FAILED - 3)
      default_params
        example at ./spec/recipe_spec.rb:18 (FAILED - 4)
      base_uri
        example at ./spec/recipe_spec.rb:26 (FAILED - 5)
      Chocolate Search
        example at ./spec/recipe_spec.rb:39 (FAILED - 6)
        size
          example at ./spec/recipe_spec.rb:42 (FAILED - 7)
        sample
          example at ./spec/recipe_spec.rb:45 (FAILED - 8)
        sample
          example at ./spec/recipe_spec.rb:46 (FAILED - 9)
        sample
          example at ./spec/recipe_spec.rb:47 (FAILED - 10)
        sample
          example at ./spec/recipe_spec.rb:48 (FAILED - 11)

    Failures:

      1) Recipe should respond to #for
         Failure/Error: it { is_expected.to respond_to(:for) }
           expected Recipe to respond to :for
         # ./spec/recipe_spec.rb:11:in `block (2 levels) in <top (required)>'

      2) Recipe Environment variable FOOD2FORK_KEY is set
         Failure/Error: expect(ENV["FOOD2FORK_KEY"]).to_not be_nil
           expected: not nil
                got: nil
         # ./spec/recipe_spec.rb:14:in `block (2 levels) in <top (required)>'

      3) Recipe default_params[:key] equals Environment variable FOOD2FORK_KEY
         Failure/Error: expect(subject.default_params[:key]).to eq ENV["FOOD2FORK_KEY"]
         NoMethodError:
           undefined method `default_params' for Recipe:Class
         # ./spec/recipe_spec.rb:22:in `block (2 levels) in <top (required)>'

      4) Recipe default_params
         Failure/Error: its(:default_params) { is_expected.to include :key }
         NoMethodError:
           undefined method `default_params' for Recipe:Class
         # ./spec/recipe_spec.rb:18:in `block (2 levels) in <top (required)>'

      5) Recipe base_uri
         Failure/Error: its(:base_uri) { is_expected.to include "http://food2fork.com/api" }
         NoMethodError:
           undefined method `base_uri' for Recipe:Class
         # ./spec/recipe_spec.rb:26:in `block (2 levels) in <top (required)>'

      6) Recipe Chocolate Search
         Failure/Error: query = Recipe.default_params.merge({"q" => "chocolate"})
         NoMethodError:
           undefined method `default_params' for Recipe:Class
         # ./spec/recipe_spec.rb:31:in `block (3 levels) in <top (required)>'

      7) Recipe Chocolate Search size
         Failure/Error: query = Recipe.default_params.merge({"q" => "chocolate"})
         NoMethodError:
           undefined method `default_params' for Recipe:Class
         # ./spec/recipe_spec.rb:31:in `block (3 levels) in <top (required)>'

      8) Recipe Chocolate Search sample
         Failure/Error: query = Recipe.default_params.merge({"q" => "chocolate"})
         NoMethodError:
           undefined method `default_params' for Recipe:Class
         # ./spec/recipe_spec.rb:31:in `block (3 levels) in <top (required)>'

      9) Recipe Chocolate Search sample
         Failure/Error: query = Recipe.default_params.merge({"q" => "chocolate"})
         NoMethodError:
           undefined method `default_params' for Recipe:Class
         # ./spec/recipe_spec.rb:31:in `block (3 levels) in <top (required)>'

      10) Recipe Chocolate Search sample
          Failure/Error: query = Recipe.default_params.merge({"q" => "chocolate"})
          NoMethodError:
            undefined method `default_params' for Recipe:Class
          # ./spec/recipe_spec.rb:31:in `block (3 levels) in <top (required)>'

      11) Recipe Chocolate Search sample
          Failure/Error: query = Recipe.default_params.merge({"q" => "chocolate"})
          NoMethodError:
            undefined method `default_params' for Recipe:Class
          # ./spec/recipe_spec.rb:31:in `block (3 levels) in <top (required)>'

    Finished in 0.01817 seconds (files took 0.39671 seconds to load)
    11 examples, 11 failures

    Failed examples:

    rspec ./spec/recipe_spec.rb:11 # Recipe should respond to #for
    rspec ./spec/recipe_spec.rb:13 # Recipe Environment variable FOOD2FORK_KEY is set
    rspec ./spec/recipe_spec.rb:21 # Recipe default_params[:key] equals Environment variable FOOD2FORK_KEY
    rspec ./spec/recipe_spec.rb:18 # Recipe default_params
    rspec ./spec/recipe_spec.rb:26 # Recipe base_uri
    rspec ./spec/recipe_spec.rb:39 # Recipe Chocolate Search
    rspec ./spec/recipe_spec.rb:42 # Recipe Chocolate Search size
    rspec ./spec/recipe_spec.rb:45 # Recipe Chocolate Search sample
    rspec ./spec/recipe_spec.rb:46 # Recipe Chocolate Search sample
    rspec ./spec/recipe_spec.rb:47 # Recipe Chocolate Search sample
    rspec ./spec/recipe_spec.rb:48 # Recipe Chocolate Search sample
    ```

6. Запустите скрипт `solution.rb`, чтобы посмотреть на результаты выполнения программы.

    ```ruby
    require_relative "assignment04-solution"

    puts Recipe.for("chocolate")
    ```

### Технические требования

1. Определите переменную окружения `FOOD2FORK_KEY` и присвойте ей значение ключа доступа `API Key`,
полученного на личной странице в разделе администрирования сервиса `food2fork.com`.

2. Создайте класс `Recipe`, реализующий HTTP API сервиса `http://food2fork.com/about/api`

3. Класс `Recipe` должен

    * быть реализован в файле `assignment04-solution.rb`.
    * импортировать HTTParty миксин
    * переопределять значение `base_uri` на `http://food2fork.com/api`
    * добавлять в параметры запроса по умолчанию параметр `key` для всех HTTP GET
    запросов, значение которого совпадает со значением переменной окружения `FOOD2FORK_KEY`.
    * определять формат возвращаемых значений как `json`

4. Класс `Recipe` должен иметь метод уровня класса `for`, который 

    * принимает фразу для поиска `keyword`
    * инициирует HTTP GET запрос, используя HTTParty gem
    * отправляет HTTP GET запрос, имеющий параметр запроса "q=keyword" и относительный адрес "/search"
    * возвращает JSON документ, содержащийся в элементе `recipes` хештаблицы, возвращаемой HTTParty

### Оценка задания

Оценка задания производится на основании выполнения unit-тестов, входящих в задание.

```shell
$ rspec

Recipe
  should respond to #for
  Environment variable FOOD2FORK_KEY is set
  default_params[:key] equals Environment variable FOOD2FORK_KEY
  default_params
    should include :key
  base_uri
    should include "http://food2fork.com/api"
  Chocolate Search
    should be a kind of Array
    size
      should eq 30
    sample
      should have key "title"
    sample
      should have key "f2f_url"
    sample
      should have key "social_rank"
    sample
      should have key "image_url"

Finished in 0.02369 seconds (files took 0.40009 seconds to load)
```

Также имеется скрипт (`solution.rb`), позволяющий выполнить тестовый запрос к сервису
и оценить результаты.


```ruby
$ ruby solution.rb 
{"publisher"=>"BBC Good Food", "f2f_url"=>"http://food2fork.com/view/9089e3", 
"title"=>"Cookie Monster cupcakes",
"source_url"=>"http://www.bbcgoodfood.com/recipes/873655/cookie-monster-cupcakes", 
"recipe_id"=>"9089e3", "image_url"=>"http://static.food2fork.com/604133_mediumd392.jpg",
"social_rank"=>100.0, "publisher_url"=>"http://www.bbcgoodfood.com"}
...
{"publisher"=>"Elana's Pantry", "f2f_url"=>"http://food2fork.com/view/22d607", 
"title"=>"Brownies", 
"source_url"=>"http://www.elanaspantry.com/brownies/", 
"recipe_id"=>"22d607", "image_url"=>"http://static.food2fork.com/dsc_8204brownies7a41.jpg", 
"social_rank"=>99.99999999990415, "publisher_url"=>"http://www.elanaspantry.com"}
```