import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? enText = '',
  }) =>
      [ruText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // A4_Analytics
  {
    'gtg7n9uo': {
      'ru': 'Жизнь без хаоса',
      'en': 'Life without chaos',
    },
    'g08zqjy8': {
      'ru': 'АНАЛИТИКА',
      'en': '',
    },
    'kh6l0jnj': {
      'ru': 'Связь настроения и задач',
      'en': '',
    },
    'fb3hshio': {
      'ru': 'Продуктивность/Настроение',
      'en': '',
    },
    'tjh5dl4n': {
      'ru': 'Неделя',
      'en': '',
    },
    'dnihjdaa': {
      'ru': 'Тренд за последние 7 дней',
      'en': '',
    },
    'cugg8dt1': {
      'ru': 'Задачи',
      'en': '',
    },
    'xobat00n': {
      'ru': 'Настроение',
      'en': '',
    },
    'ia44usok': {
      'ru': 'Ваши состояния',
      'en': '',
    },
    'kncmiph9': {
      'ru': 'Инсайты Лины',
      'en': '',
    },
    '1k03i9xs': {
      'ru': 'AI Анализ',
      'en': '',
    },
    'snhx8aqq': {
      'ru': 'Обсудить аналитику с Линой',
      'en': '',
    },
    '6oiersm2': {
      'ru': 'Home',
      'en': '',
    },
  },
  // A5_IntegrationsCRM
  {
    '84221yrb': {
      'ru': 'Интеграции',
      'en': '',
    },
    'oa75wf7i': {
      'ru': 'Синхронизация с вашим рабочим окружением',
      'en': '',
    },
    'c786b22m': {
      'ru': 'Безопасность данных',
      'en': '',
    },
    'nq5j1cli': {
      'ru':
          'Все интеграции используют протокол OAuth 2.0. Ассистент получает доступ только к необходимым метаданным для анализа задач.',
      'en': '',
    },
    '2q3pun1a': {
      'ru': 'Проверить все соединения',
      'en': '',
    },
  },
  // OnboardingPage
  {
    'btoo5o3v': {
      'ru': 'Пропустить',
      'en': '',
    },
    '3a7s6td0': {
      'ru': 'Жизнь без хаоса',
      'en': '',
    },
    'yf5xsrqn': {
      'ru': 'AI-АССИСТЕНТ v1.0',
      'en': '',
    },
    '9d3vqvym': {
      'ru':
          'Ваш персональный нейро-помощник для автоматизации звонков, задач и бизнес-коммуникаций.',
      'en': '',
    },
    'updkssds': {
      'ru': 'Голосовая активация',
      'en': '',
    },
    'qp8n2xf2': {
      'ru':
          'Активируйте ассистента фразой «Эй, Ассистент» для мгновенного выполнения задач.',
      'en': '',
    },
    '65r3o51l': {
      'ru': 'Включить отклик голосом',
      'en': '',
    },
    'qcqd0vkd': {
      'ru': 'Настроить и продолжить',
      'en': '',
    },
    '3wg91a8v': {
      'ru': 'SYSTEM_READY: УСТАНОВЛЕНО_ШИФРОВАННОЕ_СОЕДИНЕНИЕ',
      'en': '',
    },
    '8wrfmr39': {
      'ru': 'v1.0.4-stable // 152-FZ Compliant',
      'en': '',
    },
  },
  // BiometricUnlockPage
  {
    'raltfris': {
      'ru': 'Жизнь без хаоса',
      'en': '',
    },
    'odif3755': {
      'ru': 'AI-АССИСТЕНТ',
      'en': '',
    },
    'nvc25ing': {
      'ru': 'Добро пожаловать',
      'en': '',
    },
    'o7h6ipd2': {
      'ru': 'Введите PIN-код для доступа к данным',
      'en': '',
    },
    'xflde7u0': {
      'ru': 'OK',
      'en': '',
    },
    'z3rl005q': {
      'ru': 'Или воспользуйтесь биометрией',
      'en': '',
    },
    'vzz1gt8u': {
      'ru': 'Забыли PIN?',
      'en': '',
    },
    'l3uipv7s': {
      'ru': 'Выйти',
      'en': '',
    },
    'zcj3ka3h': {
      'ru': 'Ваши данные защищены по стандарту 152-ФЗ',
      'en': '',
    },
  },
  // TaskEditorPage
  {
    'k6c0d35w': {
      'ru': 'Продиктуйте задачу, и ИИ заполнит поля автоматически',
      'en': 'Dictate the task, and AI will fill in the fields automatically',
    },
    'j7pp6yjz': {
      'ru': 'Например: Подготовить отчет по продажам',
      'en': 'For example: Prepare a sales report',
    },
    'l5jhax2p': {
      'ru': 'Добавьте детали или контекст...',
      'en': 'Add details or context...',
    },
    '877out9e': {
      'ru': 'Всего: 2',
      'en': 'Total: 2',
    },
    'rz55a9yz': {
      'ru': 'Добавить участника',
      'en': 'Add a participant',
    },
    'm7nauxw9': {
      'ru': 'Синхронизация с Bitrix24',
      'en': 'Synchronization with Bitrix24',
    },
    'xzgou777': {
      'ru': 'Задача будет создана в CRM',
      'en': 'The task will be created in CRM',
    },
    'zh9dvhpp': {
      'ru': 'ПОДТВЕРДИТЬ СОЗДАНИЕ',
      'en': 'CONFIRM CREATION',
    },
  },
  // A3_AIMessagingHub
  {
    'zffjn4on': {
      'ru': 'Жизнь без хаоса',
      'en': '',
    },
    'v747rd30': {
      'ru': 'ИИ-Ассистент активен',
      'en': '',
    },
    '20s5vmdg': {
      'ru': 'ЦЕНТР СООБЩЕНИЙ',
      'en': '',
    },
    'wl2905q5': {
      'ru': '2 задачи извлечены',
      'en': '',
    },
    'i3tauztj': {
      'ru': 'Спросить AI',
      'en': '',
    },
    'oemeso4l': {
      'ru': 'ТРЕБУЮТ ВНИМАНИЯ',
      'en': '',
    },
    'xrzjtd7g': {
      'ru': 'Голосовой ответ или команда...',
      'en': '',
    },
  },
  // CallAssistant
  {
    'd6fgxt62': {
      'ru': 'В ЭФИРЕ • 04:12',
      'en': '',
    },
    'omhf3y6e': {
      'ru': 'Переговоры: Техническое задание ',
      'en': '',
    },
    'phuetuan': {
      'ru': 'ИИ-АНАЛИЗ КОНТЕКСТА',
      'en': '',
    },
    'w39htwg0': {
      'ru':
          'Обнаружено обязательство: уточнить сроки по API. Тон клиента: настойчивый.',
      'en': '',
    },
    '8u5xhzf8': {
      'ru': 'Ассистент записывает...',
      'en': '',
    },
    'egi7mfjt': {
      'ru': 'ПРЕДЛОЖЕНИЯ АССИСТЕНТА',
      'en': '',
    },
    'w7re0y46': {
      'ru': 'Без звука',
      'en': '',
    },
    'bnkigl9f': {
      'ru': 'Завершить',
      'en': '',
    },
    'qb95f0lo': {
      'ru': 'ИИ-Режим',
      'en': '',
    },
    'ux7f5fj8': {
      'ru': 'Шепнуть ассистенту...',
      'en': '',
    },
    'e5oayq1v': {
      'ru': '',
      'en': '',
    },
    'tuf7ked4': {
      'ru': 'Шепнуть ассистенту...',
      'en': '',
    },
    'rpq4ssd3': {
      'ru': 'Ассистент активен',
      'en': '',
    },
  },
  // UserSettings
  {
    'siwd7nkf': {
      'ru': 'Жизнь без хаоса',
      'en': '',
    },
    'dccbqllk': {
      'ru': 'НАСТРОЙКИ',
      'en': '',
    },
    'ybkmesj4': {
      'ru': 'Тёмный режим',
      'en': '',
    },
    'tq7aohyu': {
      'ru': 'Переключить тему приложения',
      'en': '',
    },
    'r9btbqpg': {
      'ru': 'История действий',
      'en': '',
    },
    'ahbvnsm9': {
      'ru': 'Журнал событий',
      'en': '',
    },
    '0mjimp1n': {
      'ru': 'Очистить кэш (240 МБ)',
      'en': '',
    },
    'sm22yqjz': {
      'ru': 'Жизнь без хаоса v2.4.0',
      'en': '',
    },
    '7cq03enw': {
      'ru': 'Сделано с помощью ИИ',
      'en': '',
    },
  },
  // TasksPage
  {
    'izpjb9n3': {
      'ru': 'Задачи',
      'en': '',
    },
    'dnmdkgm7': {
      'ru': 'Список дел дня',
      'en': 'SMART CALENDAR',
    },
    'jibio33s': {
      'ru': 'Все',
      'en': '',
    },
    'bg9d01pf': {
      'ru': 'Сегодня',
      'en': '',
    },
    'l7of9jv0': {
      'ru': 'Запланированные',
      'en': '',
    },
    '2mbzkvmg': {
      'ru': 'Просроченные',
      'en': '',
    },
    'ts53a73f': {
      'ru': 'Завершённые',
      'en': '',
    },
    'jxvk8va6': {
      'ru': 'Планирование дня',
      'en': '',
    },
    'ts44j9qh': {
      'ru':
          'Запустите оптимизацию дня прямо со страницы задач, а затем при необходимости откройте план-доску для ручной настройки.',
      'en': '',
    },
    'c5w0z9ik': {
      'ru': 'Собрать план',
      'en': '',
    },
    '39zxn8uc': {
      'ru': 'Открыть план-доску',
      'en': '',
    },
    'hqjf1fne': {
      'ru': 'Мои задачи',
      'en': 'TODO LIST',
    },
    '34asq9in': {
      'ru': 'Новая задача',
      'en': 'Ask AI',
    },
  },
  // HomePage
  {
    'lzz0ralf': {
      'ru': 'Home',
      'en': '',
    },
    'zbu8ub0o': {
      'ru': 'Центр управления на сегодня',
      'en': '',
    },
    'ossx8j89': {
      'ru': 'Быстрый голосовой захват',
      'en': '',
    },
    'p7v02ovd': {
      'ru': 'Запишите мысль, задачу или заметку по звонку.',
      'en': '',
    },
    'x47qqklf': {
      'ru': 'Записать',
      'en': '',
    },
    '9whx0tj1': {
      'ru': 'Спросить ИИ',
      'en': '',
    },
    'ddo8d9hi': {
      'ru': 'Текущий фокус',
      'en': '',
    },
    '6dlskd74': {
      'ru': 'Следующий блок',
      'en': '',
    },
    'wlzx53y5': {
      'ru': 'Открыть',
      'en': '',
    },
    'kf0j1c2h': {
      'ru': 'Обзор входящих',
      'en': '',
    },
    'lx4w0mqh': {
      'ru': 'Открыть входящие',
      'en': '',
    },
    '6mkf3rey': {
      'ru': 'Рекомендации ИИ',
      'en': '',
    },
    'p6ypopz5': {
      'ru': 'Проверить рекомендации',
      'en': '',
    },
    'xvknxsiv': {
      'ru': 'Панель планирования',
      'en': '',
    },
    'vvxxpidw': {
      'ru': 'Откройте календарь, задачи и блоки расписания.',
      'en': '',
    },
    'bza9f2o0': {
      'ru': 'Сегодня',
      'en': '',
    },
    '7m7v877o': {
      'ru': 'Задачи',
      'en': '',
    },
    '6lxkyi8q': {
      'ru': 'AI',
      'en': '',
    },
  },
  // A3_CallAnalyticsReports
  {
    '4ws7tp5w': {
      'ru': 'Аналитика звонка',
      'en': '',
    },
    'jvaif1lw': {
      'ru': 'ID: 4829-X',
      'en': '',
    },
    'p71q1b23': {
      'ru': 'Переговоры: ООО «Вектор»',
      'en': '',
    },
    '0k9nue8d': {
      'ru': '24 октября, 14:20 • 12 мин 45 сек',
      'en': '',
    },
    'fag6vtex': {
      'ru': 'AI КРАТКОЕ СОДЕРЖАНИЕ',
      'en': '',
    },
    'rb7vi9ax': {
      'ru':
          'Обсудили продление лицензии на 2024 год. Клиент выразил заинтересованность в модуле «Аналитика». Согласована скидка 10% при оплате до конца недели. Требуется подготовить КП.',
      'en': '',
    },
    '1hdpw0xq': {
      'ru': 'ДИНАМИКА ТОНАЛЬНОСТИ',
      'en': '',
    },
    'ku5k9d8n': {
      'ru': 'Начало: Формальное',
      'en': '',
    },
    '9c8dd01m': {
      'ru': 'Конец: Успешное',
      'en': '',
    },
    'mrx4ynd1': {
      'ru': 'ИЗВЛЕЧЕННЫЕ ЗАДАЧИ',
      'en': '',
    },
    '6b2ur0it': {
      'ru': 'Подготовить КП с учетом скидки 10%',
      'en': '',
    },
    '888bn1p6': {
      'ru': 'Дедлайн: Завтра, 12:00',
      'en': '',
    },
    'q9qr6bxt': {
      'ru': 'Отправить запись звонка в CRM',
      'en': '',
    },
    '0zrhxkny': {
      'ru': 'Автоматизация: В очереди',
      'en': '',
    },
    'bcjpl8pa': {
      'ru': 'ТРАНСКРИПЦИЯ (ФРАГМЕНТ)',
      'en': '',
    },
    'rf5ete4l': {
      'ru': 'Весь текст',
      'en': '',
    },
    'bdldw3au': {
      'ru': 'ИИ',
      'en': '',
    },
    'ohomo8tn': {
      'ru': 'Ассистент • 00:45',
      'en': '',
    },
    'xg0wqoa3': {
      'ru':
          'Добрый день, Алексей. Я звоню по поручению руководителя обсудить условия пролонгации договора.',
      'en': '',
    },
    '7e7w24sd': {
      'ru': 'АВ',
      'en': '',
    },
    'n1w1fgjo': {
      'ru': 'Алексей Волков • 01:12',
      'en': '',
    },
    '6dgm5asw': {
      'ru':
          'Да, привет. Мы как раз изучали ваше предложение. Нам интересна аналитика, но цена кажется завышенной.',
      'en': '',
    },
    'prxpr1es': {
      'ru': 'Создать задачу в Jira',
      'en': '',
    },
  },
  // AuthPage
  {
    '8qev721e': {
      'ru': 'Войти',
      'en': '',
    },
    'ym73r1d3': {
      'ru': 'Начнем с заполнения формы ниже.',
      'en': '',
    },
    'lyeeqlcc': {
      'ru': 'Email',
      'en': '',
    },
    'bwdh0s25': {
      'ru': 'flutter.coral.131@gmail.com',
      'en': '',
    },
    'rd6vfd4y': {
      'ru': 'Password',
      'en': '',
    },
    'a39qexuw': {
      'ru': '123456',
      'en': '',
    },
    '12u78zq2': {
      'ru': 'Войти',
      'en': '',
    },
    'q8wiouf5': {
      'ru': 'Забыли пароль?',
      'en': '',
    },
    '3fijapqn': {
      'ru': 'Попробовать без аккаунта',
      'en': '',
    },
    '2y8mtdv2': {
      'ru': 'Или зарегистрируйтесь с помощью',
      'en': '',
    },
    '1gttzgru': {
      'ru': 'Продолжить с Google',
      'en': '',
    },
    '0k3zy9zy': {
      'ru': 'Продолжить с Apple',
      'en': '',
    },
    'oczvq77b': {
      'ru': 'Регистрация',
      'en': '',
    },
    'itwdpxi7': {
      'ru': 'Начнем с заполнения формы ниже.',
      'en': '',
    },
    'gs7mxa8d': {
      'ru': 'Email',
      'en': '',
    },
    'izx4dy9b': {
      'ru': 'flutter.coral.131@gmail.com',
      'en': '',
    },
    'jv87kp9j': {
      'ru': 'Password',
      'en': '',
    },
    '6pciikio': {
      'ru': '123456',
      'en': '',
    },
    'axfyzeas': {
      'ru': 'Confirm Password',
      'en': '',
    },
    '4gv9lboy': {
      'ru': '123456',
      'en': '',
    },
    'ic1utg65': {
      'ru': 'Создать учетную запись',
      'en': '',
    },
    'wwb9emmy': {
      'ru': 'Или зарегистрируйтесь с помощью',
      'en': '',
    },
    'dw0345o6': {
      'ru': 'Продолжить с Google',
      'en': '',
    },
    'o58ec8zg': {
      'ru': 'Продолжить с Apple',
      'en': '',
    },
    'lz4aijml': {
      'ru': 'Home',
      'en': '',
    },
  },
  // VoiceCapturePage
  {
    'c9n2ss27': {
      'ru': 'На главную',
      'en': '',
    },
    'kkjgf438': {
      'ru': 'Голосовой захват',
      'en': '',
    },
    '4m9mjdvm': {
      'ru':
          'Основная страница для записи, загрузки, разбора ИИ, подготовки к проверке и обработки сбоев.',
      'en': '',
    },
    'p09se4gq': {
      'ru': '1. Запись',
      'en': '',
    },
    'gv8u3kiw': {
      'ru':
          'Запишите голосовую заметку, задачу или итог звонка перед запуском обработки.',
      'en': '',
    },
    'vc5xcg5t': {
      'ru': 'Текущий',
      'en': '',
    },
    '6ymrdpnc': {
      'ru': 'Начать запись',
      'en': '',
    },
    'mx9rxqyk': {
      'ru': 'Остановить запись',
      'en': '',
    },
    'a05jlj2f': {
      'ru': '2. Загрузка',
      'en': '',
    },
    'ex12mh4j': {
      'ru': 'Аудиофайл подготавливается и прикрепляется к AI-сессии.',
      'en': '',
    },
    'z63fl5lb': {
      'ru': 'Текущий',
      'en': '',
    },
    '5o7o32pr': {
      'ru': '3. Расшифровка',
      'en': '',
    },
    '4vgfp744': {
      'ru': 'Речь преобразуется в текст для последующего анализа.',
      'en': '',
    },
    'ocnhu63h': {
      'ru': 'Текущий',
      'en': '',
    },
    'yzturet9': {
      'ru': '4. Разбор',
      'en': '',
    },
    'd5djhmaw': {
      'ru': 'ИИ выделяет задачи, сущности и структуру из расшифровки.',
      'en': '',
    },
    'qvy4x593': {
      'ru': 'Текущий',
      'en': '',
    },
    'upxt6x9q': {
      'ru': '5. Готово к проверке',
      'en': '',
    },
    'zv1aoan2': {
      'ru':
          'Откройте извлечённый результат, подтвердите задачи и переходите к редактированию.',
      'en': '',
    },
    '52grsmgn': {
      'ru': 'Текущий',
      'en': '',
    },
    '37irc6e0': {
      'ru': 'Задачи готовы к проверке!',
      'en': '',
    },
    '0kreze2d': {
      'ru': 'Проверить задачи',
      'en': '',
    },
    'h6bxfzsb': {
      'ru': 'Назад к задачам',
      'en': '',
    },
    'muu8fd5v': {
      'ru': '6. Ошибка',
      'en': '',
    },
    'jcwa841n': {
      'ru':
          'Если загрузка или обработка ИИ завершается сбоем, покажите ошибку сессии и предложите повторные действия.',
      'en': '',
    },
    '2ogvfe1z': {
      'ru': 'Текущий',
      'en': '',
    },
    '4fx1sd5y': {
      'ru': 'Повторить захват',
      'en': '',
    },
  },
  // PlanBoardPage
  {
    '3il3ri03': {
      'ru': 'Перепланировать расписание',
      'en': '',
    },
    'zffozfvg': {
      'ru': 'Оптимизация потока с учетом 2 фиксированных ограничений',
      'en': '',
    },
  },
  // TaskReviewPage
  {
    '9yuxsuuo': {
      'ru': 'Проверка задачи',
      'en': '',
    },
    'tjgk15d8': {
      'ru': 'Проверка черновика от AI',
      'en': '',
    },
    'znmcb8o1': {
      'ru': 'Детали черновика',
      'en': '',
    },
    '1usojnja': {
      'ru': 'Одобрить',
      'en': '',
    },
    'bf0v1b3p': {
      'ru': 'Нужны правки',
      'en': '',
    },
    'runxetve': {
      'ru': 'Отклонить',
      'en': '',
    },
  },
  // InboxPage
  {
    '3au6qscx': {
      'ru': 'На главную',
      'en': '',
    },
    'hjctqlm4': {
      'ru': 'Входящие',
      'en': '',
    },
    't33wayt4': {
      'ru': 'Проверка черновика ',
      'en': '',
    },
    'zxo0lwur': {
      'ru': 'Проверить черновик',
      'en': '',
    },
  },
  // TodayPage
  {
    '8gjb6zxb': {
      'ru': 'На главную',
      'en': '',
    },
    'dhv711nm': {
      'ru': 'Сегодня',
      'en': '',
    },
    'zw1bamno': {
      'ru': 'Контекст выполнения',
      'en': '',
    },
    't48w5xwv': {
      'ru': 'Текущий / следующий слот',
      'en': '',
    },
    'k16sk7mw': {
      'ru':
          'Рекомендуемое действие: завершите текущий блок, если он выполнен, отложите его на следующий день или перепланируйте, если слот больше не подходит.',
      'en': '',
    },
    'chu5d4a0': {
      'ru': 'Завершить',
      'en': '',
    },
    'ub3wo2zp': {
      'ru': 'Отложить',
      'en': '',
    },
    'zp30dmwx': {
      'ru': 'Изменить',
      'en': '',
    },
  },
  // BehaviorTimelinePage
  {
    'ahko1ubg': {
      'ru': 'История действий',
      'en': '',
    },
  },
  // EditProfilePage
  {
    '5svoixl4': {
      'ru': 'Редактировать профиль',
      'en': '',
    },
    'p90ezlw8': {
      'ru': 'Имя',
      'en': '',
    },
    'tlo3iole': {
      'ru': 'Телефон',
      'en': '',
    },
    'gqg4qy6y': {
      'ru': 'Сохранить',
      'en': '',
    },
    '9ekedzt4': {
      'ru': 'Отмена',
      'en': '',
    },
  },
  // SignInPage
  {
    'h5nlbxyu': {
      'ru': 'Home',
      'en': '',
    },
  },
  // SignUpPage
  {
    '61bw7c2b': {
      'ru': 'Home',
      'en': '',
    },
  },
  // ForgotPasswordPage
  {
    '3u42dlct': {
      'ru': 'Home',
      'en': '',
    },
  },
  // SocialAuthPage
  {
    'voxfow79': {
      'ru': 'Home',
      'en': '',
    },
  },
  // FormLabel
  {
    'vk0g14i2': {
      'ru': '*',
      'en': '',
    },
  },
  // MessageItem
  {
    'mym4lrjd': {
      'ru': 'AI ЧЕРНОВИК',
      'en': '',
    },
    'p116dg1w': {
      'ru': 'Отправить',
      'en': '',
    },
    'ls6qu96r': {
      'ru': 'Правка',
      'en': '',
    },
  },
  // ProfileCard
  {
    'rh1y3fkc': {
      'ru': 'АИ',
      'en': '',
    },
    'k39fhi0j': {
      'ru': 'Premium Active',
      'en': '',
    },
    'ndvnu7l7': {
      'ru': 'Редактировать',
      'en': '',
    },
    'bf1ifxq7': {
      'ru': 'Выйти',
      'en': '',
    },
  },
  // AiRecommendation
  {
    'bakx6bs1': {
      'ru': 'AI РЕКОМЕНДАЦИЯ',
      'en': '',
    },
  },
  // AI_SchedulePreview
  {
    '213oq7ao': {
      'ru': 'Новый план',
      'en': '',
    },
    'r3q7sx9s': {
      'ru': 'ОПТИМИЗИРОВАНО',
      'en': '',
    },
    '4y0eqbww': {
      'ru': 'Предлагаемый график на сегодня с учетом ваших целей',
      'en': '',
    },
    'sq7m8ddu': {
      'ru': 'Отменить',
      'en': '',
    },
    'snv700jh': {
      'ru': 'Применить план',
      'en': '',
    },
  },
  // EditScheduleItemSheet
  {
    '37i0wa3f': {
      'ru': 'Редактировать',
      'en': '',
    },
    'e4ns1me3': {
      'ru': 'Задача',
      'en': '',
    },
    'fh9wcnw3': {
      'ru': 'Что нужно сделать?',
      'en': '',
    },
    '39ces3qj': {
      'ru': 'Начало',
      'en': '',
    },
    'ma7tm47r': {
      'ru': 'Длительность (мин)',
      'en': '',
    },
    'qafewpxy': {
      'ru': '',
      'en': '',
    },
    'xalhpysi': {
      'ru': 'Минуты',
      'en': '',
    },
    'tqkyaxa6': {
      'ru': 'Locked',
      'en': '',
    },
    'fzw7egv4': {
      'ru': 'Запретить пересчёт',
      'en': '',
    },
    '7gyplt5w': {
      'ru': 'Высокий приоритет',
      'en': '',
    },
    'ljiar01j': {
      'ru': 'Пометить как важную задачу',
      'en': '',
    },
    '9tcfmx9v': {
      'ru': 'Уведомления',
      'en': '',
    },
    'v71nzdtf': {
      'ru': 'Напомни мне за 10 минут',
      'en': '',
    },
    '10kya1e5': {
      'ru': 'Сохранить изменения',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'uxwqzehz': {
      'ru': 'Required for communicating with the AI agent',
      'en': '',
    },
    '5xdz0ep9': {
      'ru': 'Required for communicating with the AI agent',
      'en': '',
    },
    'f4rr9c33': {
      'ru': 'Required for communicating with the AI agent',
      'en': '',
    },
    '0p7vznkp': {
      'ru': '',
      'en': '',
    },
    'zx9e3dhm': {
      'ru': '',
      'en': '',
    },
    '25i1az66': {
      'ru': '',
      'en': '',
    },
    'hymwoj6w': {
      'ru': '',
      'en': '',
    },
    'nc7o6b3e': {
      'ru': '',
      'en': '',
    },
    'b5q7psid': {
      'ru': '',
      'en': '',
    },
    'zdhs37dt': {
      'ru': '',
      'en': '',
    },
    '5otyvbk7': {
      'ru': '',
      'en': '',
    },
    'ohekvszk': {
      'ru': '',
      'en': '',
    },
    '9vpvknyu': {
      'ru': '',
      'en': '',
    },
    '7xjj8lyx': {
      'ru': '',
      'en': '',
    },
    'yvyzzw4p': {
      'ru': '',
      'en': '',
    },
    'aqksgynh': {
      'ru': '',
      'en': '',
    },
    'rj9dczp9': {
      'ru': '',
      'en': '',
    },
    '9s2k1d5p': {
      'ru': '',
      'en': '',
    },
    '0bb8h53j': {
      'ru': '',
      'en': '',
    },
    '5azry2yw': {
      'ru': '',
      'en': '',
    },
    'exmzjbk8': {
      'ru': '',
      'en': '',
    },
    '0lbxqj98': {
      'ru': '',
      'en': '',
    },
    'nirmcu8t': {
      'ru': '',
      'en': '',
    },
    'd451onha': {
      'ru': '',
      'en': '',
    },
    'xb4xlpu9': {
      'ru': '',
      'en': '',
    },
    '2gi8sug9': {
      'ru': '',
      'en': '',
    },
    '5skzdzuq': {
      'ru': '',
      'en': '',
    },
    'd920cnuh': {
      'ru': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
