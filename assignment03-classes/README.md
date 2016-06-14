## Задание 3: Classes

Цель задания - реализовать класс на Ruby, содержащий
* атрибуты класса
* методы класса
* методы инициализации
* атрибуты экземпляра класса
* методы экземпляра класса

Функциональная цель задания - написать класс `Person`, который поддерживает 
состояния, используя атрибуты экземпляра и класса, и предоставляет доступ к 
состоянию через методы экземпляра и класса.

### Функциональные требования

1. Написать класс `Person`, содержащий 

  * `first_name`
  * `last_name`

2. Отслеживать каждый экземпляр `Person`.

3. Реализовать поиск для объектов `Person` по `last_name`.

### Приступая к работе

1. Скачайте заглушку проекта. Корень проекта `student-start` имеет следующую структуру
```text
|-- assignment03-solution.rb
|-- .rspec (important hidden file)
`-- spec
    |-- lesson3_spec.rb
    `-- spec_helper.rb
```
  * assignment03-solution.rb - файл-заглушка решения.
  Ваше решение должно быть помещено в этот файл.
  * spec - директория содержит тесты для проверки задания. Содержимое директории не следует менять.
  * .rspec - файл конфигурации юнит-тестов. Его также не следует менять.

2. Установите следущие `gem`, используемые для модульного тестирования.
```shell
$ gem install rspec
$ gem install rspec-its
```

3. Выполните комманду `rspec` в корне проекта. Результатом выполнения будут ошибки до тех пор,
пока вы не выполните задание.
```shell
$ rspec

FFF.

Failures:

  1) lesson3 check results unexpected search result
  2) lesson3 check instance properties missing first_name
  3) lesson3 check instance properties missing last_name

Finished in 0.0184 seconds (files took 0.11245 seconds to load)
4 examples, 3 failures

Failed examples:

rspec ./spec/lesson3_spec.rb:13 # lesson3 check results unexpected search result
rspec ./spec/lesson3_spec.rb:21 # lesson3 check instance properties missing first_name
rspec ./spec/lesson3_spec.rb:25 # lesson3 check instance properties missing last_name
```

4. Выполните задание и перезапустите тесты. 

### Технические требования

1. Выполните задание и поместите его в файл `assignment03-solution.rb`, помещенный 
в корневой каталог проекта. 

2. Скрипт должен содержать класс `Person`

3. Класс `Person` должен иметь

  * атрибуты `first_name` и `last_name` и методы доступа для указанных атрибутов
  * атрибут класса `people`, который содержит список объектов
  * метод `initialize` для инициализации экземпляров класса
  * метод `to_s`, возвращающий отформатированную строку, содержащую имя персоны
  * метод `search` для поиска экземпляров по атрибуту `last_name`
  
4. Метод `initialize` класса `Person` должен

  * принимать два параметра (`first_name` и `last_name`) и использовать их для 
  инициализации атрибутов `first_name` и `last_name` экземпляра класса
  * добавлять созданный экземпляр класса `self` в переменную класса `people`

5. Метод `to_s` экземпляра `Person` должен

  * возвращать отформатированную строку вида `first_name(пробел)last_name`

6. Метод `search` класса `Person` должен

  * принмать параметр `last_name`
  * осуществлять поиск в атрибуте класса `people` элементов, совпадающих по атрибуту экземпляра `last_name` с переданным параметром
  * возвращать коллекцию найденных объектов

### Оценка задания

Задание содержит юнит тесты для проверки задания. После выполнения их необходимо запустить 
следующей коммандой

```shell
$ rspec

John Smith
Jane Smith
....

Finished in 0.00436 seconds (files took 0.10999 seconds to load)
4 examples, 0 failures
```

Успешно выполненное задание должно иметь следующий вывод.

```shell
$ ruby module2_lesson3_formative.rb

John Smith
Jane Smith
```