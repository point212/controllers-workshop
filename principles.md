# Конспект / Принципы

1. Пишите на Рельсах? Пишите по-Рельсовому. Забейте на DRY/KISS/SOLID и т.п. Если можно сделать тупее, быстрее, средствами рельс - делайте. 
Коллбэки, валидация и логика в моделях - это ок. Пока не начнёт болеть. Тогда выносить.
2. Разделяйте контроллеры по представлениям. А представления по bounded context. Контроллер должен быть максимально прямолинейный, без if-ов. Достал инфу в одном виде. В том же виде отрендерил. 
Если приходится инфу как-то готовить для разных случаев, значит вам нужен еще один контроллер
3. Делайте иерархию контроллеров. И на каждом уровне - корневой, в котором будут общие для всех наследников вещи (например аутентификация, какие-то ещё хуки)
4. Тестируйте экшены на 200/404, и в идеале на возвращаемые данные/изменения в БД которые произвёл экшн. Этого достаточно
5. Minitest + power-assert рулит. Не юзайте матчеры. Вам покажут где больно.
6. Делайте просто и легко там где это не будет трогаться, и меняться еще долго. Но если видите что постоянно происходят правки в каком-то месте кода (churn rate), то там старайтесь довести до идеала
7. Не руководствуйтесь тем что: "это не соответствует паттерну", "у нас так в rubocop записано", "слишком длинная строка", "слишком много строк в методе". Используйте голову. Если вы видите, и вся команда согласна что тут тяжело понять - значит надо переделать