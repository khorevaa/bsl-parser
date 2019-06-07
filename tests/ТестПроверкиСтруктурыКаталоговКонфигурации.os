///////////////////////////////////////////////////////////////////
//
// Тестирование основной функциональности пакета
// Проверка на соответствие выгрузки эталону
//
// (с) BIA Technologies, LLC	
//
///////////////////////////////////////////////////////////////////

#Использовать asserts
#Использовать ".."

///////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////
// Программный интерфейс
///////////////////////////////////////////////////////////////////

Функция ПолучитьСписокТестов(Знач ЮнитТестирование) Экспорт
	
	МассивТестов = Новый Массив;

	МассивТестов.Добавить("ТестСтруктураКаталоговВыгрузкаКонфигуратора");
	МассивТестов.Добавить("ТестСтруктураКаталоговВыгрузкаEDT");

	Возврат МассивТестов;
	
КонецФункции

Процедура ПередЗапускомТеста() Экспорт
	
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
		
КонецПроцедуры

///////////////////////////////////////////////////////////////////
// Шаги
///////////////////////////////////////////////////////////////////

Процедура ТестСтруктураКаталоговВыгрузкаКонфигуратора() Экспорт
	

	КаталогКонфигурации = "configuration";
	СтруктураКаталоговКонфигурации = Новый СтруктураКаталоговКонфигурации(КаталогКонфигурации, ФорматыВыгрузки.Конфигуратор_8_3_10);
	
	// Корневой каталог
	Утверждения.ПроверитьРавенство(СтруктураКаталоговКонфигурации.КорневойКаталог(), КаталогКонфигурации, "Некорректный каталог конфигурации");
	
	// Каталог справочника
	Эталон = ОбъединитьПути(КаталогКонфигурации, "Catalogs", "Пользователи");
	Утверждения.ПроверитьРавенство(СтруктураКаталоговКонфигурации.КаталогФайловОбъекта("Пользователи", "Catalog"), Эталон, "Некорректный каталог конфигурации");
	
	// Каталог файлов дополнительных файлов описания справочника
	Эталон = ОбъединитьПути(КаталогКонфигурации, "Catalogs", "Пользователи", "Ext");
	Утверждения.ПроверитьРавенство(СтруктураКаталоговКонфигурации.КаталогДополнительныхФайловОбъекта("Пользователи", "Catalog"), Эталон, "Некорректный каталог доп. файлов объекта");

	// Каталог вида объекта
	Эталон = ОбъединитьПути(КаталогКонфигурации, "Catalogs");
	Утверждения.ПроверитьРавенство(СтруктураКаталоговКонфигурации.КаталогВидаОбъекта("Catalog"), Эталон, "Некорректный каталог вида объекта");
	
	// Каталог описания конфигурации
	Эталон = ОбъединитьПути(КаталогКонфигурации, "Configuration.xml");
	Утверждения.ПроверитьРавенство(СтруктураКаталоговКонфигурации.ИмяФайлаОписанияКонфигурации(), Эталон, "Некорректное имя файла описания конфигурации");

	// Файл описания объекта
	Эталон = ОбъединитьПути(КаталогКонфигурации, "Catalogs", "Пользователи.xml");
	Утверждения.ПроверитьРавенство(СтруктураКаталоговКонфигурации.ИмяФайлаОписанияОбъекта("Пользователи", "Catalog"), Эталон, "Некорректное имя файла описания объекта");
	
	// Файл модуля объекта
	Эталон = ОбъединитьПути(ОбъединитьПути(КаталогКонфигурации, "Catalogs", "Пользователи"), "Ext", "ObjectModule.bsl");
	Утверждения.ПроверитьРавенство(СтруктураКаталоговКонфигурации.ИмяФайлаМодуля("Пользователи", "Catalog", "ObjectModule"), Эталон, "Некорректное имя файла модуля");

КонецПроцедуры

Процедура ТестСтруктураКаталоговВыгрузкаEDT() Экспорт
	

	КаталогКонфигурации = "configuration";
	СтруктураКаталоговКонфигурации = Новый СтруктураКаталоговКонфигурации(КаталогКонфигурации, ФорматыВыгрузки.EDT);
	
	// Корневой каталог
	Утверждения.ПроверитьРавенство(СтруктураКаталоговКонфигурации.КорневойКаталог(), КаталогКонфигурации, "Некорректный каталог конфигурации");
	
	// Каталог справочника
	Эталон = ОбъединитьПути(КаталогКонфигурации, "Catalogs", "Пользователи");
	Утверждения.ПроверитьРавенство(СтруктураКаталоговКонфигурации.КаталогФайловОбъекта("Пользователи", "Catalog"), Эталон, "Некорректный каталог конфигурации");
	
	// Каталог файлов дополнительных файлов описания справочника
	Эталон = ОбъединитьПути(КаталогКонфигурации, "Catalogs", "Пользователи");
	Утверждения.ПроверитьРавенство(СтруктураКаталоговКонфигурации.КаталогДополнительныхФайловОбъекта("Пользователи", "Catalog"), Эталон, "Некорректный каталог доп. файлов объекта");

	// Каталог вида объекта
	Эталон = ОбъединитьПути(КаталогКонфигурации, "Catalogs");
	Утверждения.ПроверитьРавенство(СтруктураКаталоговКонфигурации.КаталогВидаОбъекта("Catalog"), Эталон, "Некорректный каталог вида объекта");
	
	// Каталог описания конфигурации
	Эталон = ОбъединитьПути(КаталогКонфигурации, "Configuration", "Configuration.mdo");
	Утверждения.ПроверитьРавенство(СтруктураКаталоговКонфигурации.ИмяФайлаОписанияКонфигурации(), Эталон, "Некорректное имя файла описания конфигурации");

	// Файл описания объекта
	Эталон = ОбъединитьПути(КаталогКонфигурации, "Catalogs", "Пользователи", "Пользователи.mdo");
	Утверждения.ПроверитьРавенство(СтруктураКаталоговКонфигурации.ИмяФайлаОписанияОбъекта("Пользователи", "Catalog"), Эталон, "Некорректное имя файла описания объекта");
	
	// Файл модуля объекта
	Эталон = ОбъединитьПути(КаталогКонфигурации, "Catalogs", "Пользователи", "ObjectModule.bsl");
	Утверждения.ПроверитьРавенство(СтруктураКаталоговКонфигурации.ИмяФайлаМодуля("Пользователи", "Catalog", "ObjectModule"), Эталон, "Некорректное имя файла модуля");

КонецПроцедуры

///////////////////////////////////////////////////////////////////
// Служебный функционал
///////////////////////////////////////////////////////////////////
