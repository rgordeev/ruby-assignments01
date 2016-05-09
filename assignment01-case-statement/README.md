## Задание 1: Case Statement

Целью задания является реализация механизма управления программы, используя Ruby, который

* Правильно проверяет равенство объектов
* Правильно проверяет `nil` значения
* Правильно проверяет булевы `true` /` false` значения 
* Реализует эти тесты, используя оператор ветвления `case` 

Формально цель задания - переписать выражения, использующие
операторы ветвления `if/else`, с помощью оператора `case`.

### Функциональные требования

1. Переписать следующее `if/else` выражение, используя `case` оператор на Ruby.
  ```ruby
  some_var = "false"
  another_var = "nil"

  if some_var == "pink elephant"
    puts "Don't think about the pink elephant!"

  elsif another_var.nil?
    puts "Question mark in the method name?"

  elsif some_var == false
    puts "Looks like this one should execute"

  else
    puts "I guess nothing matched... But why?"
  end
  ```
2. Анализ результатов выполнения оригинального скрипта и установление
причины, по которой каждый из первых трех (3) тестов завершается неудачей,
и как это можно исправить.
  ```shell
  $ ruby assignmet01-solution.rb

  I guess nothing matched... But why?
  ```

Измените исходный код решения, чтобы проверить вашу гипотезу.

### Getting Started

1. Скачайте исходные коды приложения. Корень директории `student-start` будет являться корневым каталогом вашего решения.
  ```text
  --- student-start
     |-- assignmet01-solution.rb
     `-- spec
         |-- lesson1_spec.rb
         `-- spec_helper.rb
  ```
  * assignmet01-solution.rb - содержит исходное `if/else` выражение. Ваше решение должно быть оформлено в этом файле.
  * spec - этот каталог содержит тесты, чтобы проверить свое решение. Вы не должны ничего изменять в этом каталоге
  * .rspec - файл конфигурации для модульных тестов. Если вы переместите файлы проекта в другую директорию, то должны также скопировать и этот файл. 

2. Установите следующие `gem`, используемые `rspec` для модульных тестов. Возможно некоторые из них уже установлены.
  ```shell
  $ gem install rspec
  $ gem install rspec-its
  ```

3. Запустите предоставленный сценарий `ruby`, содержащий `if/else` выражение
  ```shell
  $ ruby assignmet01-solution.rb

  I guess nothing matched... But why?
  ```

4. Запустите `rspec` команду для выполнения модульных тестов, определенных в диретории `spec`. Эта команда должна быть запущена из корневой директории проекта. Выполнение будет заканчиваться сообщениями о неудачном запуске тестов, пока вы не решите задание.
  ```shell
  $ rspec

  .FFF

  Failures:
  ...
  Finished in 0.02247 seconds (files took 0.1567 seconds to load)
  4 examples, 3 failures

  Failed examples:

  rspec ./spec/case_spec.rb:17 # lesson1 check implementation remove if clause
  rspec ./spec/case_spec.rb:21 # lesson1 check implementation remove elsif clause
  rspec ./spec/case_spec.rb:25 # lesson1 check implementation missing case
  ```

5. Выполните задание и снова запустите тест.

### Технические тербования

1. Реализовать все части этого задания в пределах файла `module2_lesson1_formative.rb` 
в корневом каталоге вашего решения. 

2. Удалить все выражения `if`, `elsif`.

3. Выполнить задание, используя оператор `case`.

4. Вернить точно такое же значение, которое программа возвращала, до применения опертора `case`.

### Оценка выполнения задания

Для оценки решения используются юнит-тесты, которые включены в начальную структуру проекта. 
Они должны быть запущены из тойже директории, в которой находится ваше решение.

```shell
$ rspec

Finished in 0.00304 seconds (files took 0.16353 seconds to load)
4 examples, 0 failures
```