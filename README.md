# Привет!
Проект посвещён созданию приложения JoinYouTeam являющегося совместным домашним заданием от SwiftBook.
Задачи по проекту находятся [здесь](/ReadMe/Tasks.md)

## Как работать с проектом:

### 1. Делаем fork проекта в свой репозиторий
Для этого переходим в основной репозиторий: [JoinYouTeam repo](https://github.com/2-39-swiftbook-joint-project/JoinYouTeam)

Раскрываем Fork:

<kbd>
  <img src="/ReadMe/Img/fork.png" height=200>
</kbd>

Создаём новый Fork:

<kbd>
  <img src="/ReadMe/Img/newfork.png" height=200>
</kbd>

Вносим настроки (галочку с **copy the main branch only** снимаем):

<kbd>
  <img src="/ReadMe/Img/forksetting.png" height=200>
</kbd>

### 2. Клонируем репозиторий:

Теперь заходим в свой аккаунт guthub и переходим в fork-нутый проект чтобы кланировать проект на свою локальную машину:

<kbd>
  <img src="/ReadMe/Img/code.png" height=200>
</kbd>

Для этого в выпадающем меню копируем ссылку на репозиторий:

<kbd>
  <img src="/ReadMe/Img/copycode.png" height=200>
</kbd>

Открываем Xcode, выбираем Клонирование репозитория:

<kbd>
  <img src="/ReadMe/Img/clone.png" height=200>
</kbd>

И вставляем ссылку на **свой** репозиторий:

<kbd>
  <img src="/ReadMe/Img/clonelink.png" height=200>
</kbd>

Теперь можно не бояться сломать общий проект, но для разработки своих фичей всё же стоит создавать отдельные ветки в своём репозитории.

## Как создать ветку

Склонировав проект из гитхаба переходим во вкладку Repositories и создаём новую ветку (в качестве названия рекомендуется использовать название реализуемого функционала-таска):

<kbd>
  <img src="/ReadMe/Img/newBranch.png" height=200>
</kbd>

## Как слить ветку

После внесения изменений в проект делаем комит (без пуша).
Переходим в ветку main:

<kbd>
  <img src="/ReadMe/Img/switchBranch.png" height=200>
</kbd>

И делаем слияние:

<kbd>
  <img src="/ReadMe/Img/merge.png" height=200>
</kbd>

После этого можно сделать Push в свой гитхаб

## Как сделать Пулреквест

Перед созданием пул реквеста необходимо синхронизировать свой репозиторий из общего:

<kbd>
  <img src="/ReadMe/Img/syncFork.png" height=200>
</kbd>

<kbd>
  <img src="/ReadMe/Img/updateBranch.png" height=200>
</kbd>

Теперь жмём Contribute:

<kbd>
  <img src="/ReadMe/Img/contribute.png" height=200>
</kbd>

И открываем пул реквест:

<kbd>
  <img src="/ReadMe/Img/openPullRequest.png" height=200>
</kbd>

Выбераем ветку в которую вносим изменения (всегда main) и из какой (тоже main):

<kbd>
  <img src="/ReadMe/Img/createPullRequest.png" height=200>
</kbd>

Добавляем заголовок и описание для своих изменений, после жмём **Create pull request**:

<kbd>
  <img src="/ReadMe/Img/addTitlePullRequest.png" height=200>
</kbd>

Пул реквест отправляется на проверку. После утверждения всеми, кто до этого брал на себя задачи и форкал основной репозиторий, изменения зальются в общий гитхаб. 

