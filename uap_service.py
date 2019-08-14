# -*- coding: utf-8 -

from iso8601 import parse_date
import dateutil.parser
from datetime import datetime, date, time, timedelta
from pytz import timezone
import os
import re

TZ = timezone(os.environ['TZ'] if 'TZ' in os.environ else 'Europe/Kiev')

def get_all_etender_dates(initial_tender_data, key, subkey=None):
    tender_period = initial_tender_data.data.auctionPeriod
    start_dt = dateutil.parser.parse(tender_period['startDate'])
    data = {
        'StartDate': {
            'date': start_dt.strftime("%d.%m.%Y"),
            'time': start_dt.strftime("%H:%M"),
        },
    }
    dt = data.get(key, {})
    return dt.get(subkey) if subkey else dt

def convert_iso8601Duration(duration):
    if duration == u'P1M':
        duration = u'P30D'
    dayDuration = re.search('\d+D|$', duration).group()
    if len(dayDuration) > 0:
        dayDuration = dayDuration[:-1]
    return dayDuration

def get_etender_date_from_iso(isodate):
    return (dateutil.parser.parse(isodate).strftime('%d.%m.%Y'), dateutil.parser.parse(isodate).strftime('%H:%M'))

def parse_etender_date(date):
    # converts date from ui to datetime
    return datetime.strptime(date, '%d.%m.%Y %H:%M')

def convert_etender_date_to_iso_format(date):
    return TZ.localize(parse_etender_date(date)).isoformat()

def add_timezone_to_date(date_str):
    new_date = datetime.strptime(date_str, "%Y-%m-%d %H:%M:%S")
    new_date_timezone = TZ.localize(new_date)
    return new_date_timezone.isoformatget_etender_date_from_iso()

def convert_dgfDecisionDateOut_to_etender_format(date_str):
    timedata = datetime.strptime(date_str, '%d.%m.%Y')
    stringdata = timedata.strftime("%Y-%m-%d")
    return stringdata

def convert_dgfDecisionDate_to_etender_format(date_str):
    timedata = datetime.strptime(date_str, '%Y-%m-%d')
    return timedata.strftime('%d.%m.%Y')

def convert_date_to_etender_format(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%d.%m.%Y")
    return date_string

def convert_etender_date_to_ymd(date_str):
    timedata = datetime.strptime(date_str, '%d.%m.%Y')
    date_string = timedata.strftime("%Y-%m-%d")
    return date_string

def convert_datetime_for_delivery(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%Y-%m-%d %H:%M")
    return date_string

def convert_time_to_etender_format(isodate):
    iso_dt = parse_date(isodate)
    time_string = iso_dt.strftime("%H:%M")
    return time_string

def convert_contractPeriod_date_from_etender_format_to_isoformat(contractPeriod_date):
    tmp_date = datetime.strptime(contractPeriod_date, '%d.%m.%Y')
    TZ = timezone(os.environ['TZ'] if 'TZ' in os.environ else 'Europe/Kiev')
    date_with_timezone_and_shift = TZ.localize(tmp_date)
    time_string = date_with_timezone_and_shift.isoformat()
    return time_string



def float_to_string_2f(value):
    return '{:.2f}'.format(value)

def adapt_data(initial_data):
    initial_data['data']['assetCustodian']['name'] = u"holder"
    initial_data['data']['assetCustodian']['address']['locality'] = u"місто Полтава"
    initial_data['data']['assetCustodian']['address']['postalCode'] = '21332'
    initial_data['data']['assetCustodian']['address']['region'] = u"Полтавська область"
    initial_data['data']['assetCustodian']['address']['streetAddress'] = u"Sevastopol 13F"

    initial_data['data']['assetCustodian']['contactPoint']['email'] = u"eauction@meta.ua"
    initial_data['data']['assetCustodian']['contactPoint']['faxNumber'] = u""
    initial_data['data']['assetCustodian']['contactPoint']['name'] = u"holder holder holder"
    initial_data['data']['assetCustodian']['contactPoint']['telephone'] = '675555555555'
    initial_data['data']['assetCustodian']['contactPoint']['url'] = u""

    initial_data['data']['assetCustodian']['identifier']['id'] = '12641656'
    initial_data['data']['assetCustodian']['identifier']['legalName'] = u"holder"
    return initial_data

def convert_etender_string_to_common_string(string):
    dict = get_helper_dictionary()
    return dict.get(string, string)

def convert_common_string_to_etender_string(string):
    dict = {i[1]: i[0] for i in get_helper_dictionary().items()}
    return dict.get(string, string)

def get_helper_dictionary():
    return {
        u"ящ.": u"ящик",
        u"Гкал": u"Гігакалорія",
        u"посл.": u"послуга",
        u"роб.": u"роботи",
        u"шт.": u"штуки",
        u"га.": u"гектар",
        u"кг.": u"кілограми",
        u"км": u"кілометри",
        u"комп.": u"комплект",
        u"кВт⋅год": u"Кіловат-година",
        u"пог.м.": u"Погонний метр",
        u"л.": u"літр",
        u"м.кв.": u"метри квадратні",
        u"м.куб.": u"метри кубічні",
        u"м": u"метри",
        u"пач.": u"пачок",
        u"упак.": u"упаковка",
        u"пар.": u"пара",
        u"т.м.куб": u"тисяча кубічних метрів",
        u"наб.": u"набір",
        u"т.": u"тони",

        u"Очікування пропозицій":   u"active.tendering",
        u"Період аукціону":         u"active.auction",
        u"Кваліфікація переможця":  u"active.qualification",
        u"Кандидат розглядається":  u"active.qualification",
        u"Пропозиції розглянуто":   u"active.awarded",
        u"Переможця визначено":     u"active.awarded",
        u"Оплачено, очікується підписання договору": u"active.awarded",
        u"Закупівля не відбулась":  u"unsuccessful",
        u"Аукціон не відбувся":     u"unsuccessful",
        u"Торги не відбулись":      u"unsuccessful",
        u"Торги не відбулися":      u"unsuccessful",
        u"Відмінена закупівля":     u"cancelled",
        u"Відмінений аукціон":      u"cancelled",
        u"Торги відмінено":         u"cancelled",
        u"cancellation.status=Торги не відбулися": u"active", # workaround to distinguish between auction and cancellation
        u"cancellation.status=Торги відмінено": u"active", # workaround to distinguish between auction and cancellation
        u"Договір опубліковано": u"active", # contract status
        u"Протокол торгів": u"auctionProtocol", # document type
        u"Ліцензія": u"financialLicense", # document type

        u"Київська область": u"місто Київ",

        u"Опубліковано. Очікування інформаційного повідомлення": u"pending",
        u"Виключено з переліку": u"deleted",

        u"Ілюстрації": u"illustration",
        u"Презентація": u"x_presentation",
        u"Підстава для виключення об'єкту з переліку": u"cancellationDetails",
        u"Інформація про об'єкт малої приватизації": u"technicalSpecifications",
        u"Рішення про затвердження переліку об’єктів, що підлягають приватизації": u"notice",
        u"Інформація по оприлюдненню інформаційного повідомлення": u"informationDetails",
        u"ЄДРПОУ": u"UA-EDR",
        u"об'єкт зареєстровано": u"complete",
        u"Аукціон":u"sellout.english",
        u"Аукціон із зниженням стартової ціни": u"sellout.english",
        u"Аукціон за методом покрокового зниження стартової ціни та подальшого подання цінових пропозицій": u"sellout.insider"
    }

def get_lot_document_name(type):
    return {
        u"notice": u"Рішення аукціонної комісії",
        u"technicalSpecifications": u"Інформація про об'єкт малої приватизації",
        u"illustration": u"Ілюстрації",
        u"x_presentation": u"Презентація",
        u"cancellationDetails": u"Причини скасування",
        u"x_dgfAssetFamiliarization": u"Час і місце проведення огляду об’єкта",
        u"evaluationCriteria": u"Умови продажу та/або експлуатації об’єкта приватизації",
        u"x_PlatformLegalDetails": u"Перелік та реквізити авторизованих електронних майданчиків"}[type]

def convert_unit_name_to_unit_code(string):
    return {
        u"ящик": u"BX",
        u"блок": u"D64",
        u"Гігакалорія": u"E11",
        u"послуга": u"E48",
        u"роботи": u"E51",
        u"рейс": u"E54",
        u"штуки": u"H87",
        u"гектар": u"HAR",
        u"кілограми": u"KGM",
        u"кілометри": u"KMT",
        u"комплект": u"KT",
        u"Кіловат-година": u"KWH",
        u"Погонний метр": u"LM",
        u"лот": u"LO",
        u"літр": u"LTR",
        u"місяць": u"MON",
        u"метри квадратні": u"MTK",
        u"метри кубічні": u"MTQ",
        u"метри": u"MTR",
        u"пачок": u"NMP",
        u"упаковка": u"PK",
        u"пара": u"PR",
        u"тисяча кубічних метрів": u"R9",
        u"пачка": u"RM",
        u"набір": u"SET",
        u"тони": u"TNE",
    }.get(string, string)

def prepare_locator_to_scroll(locator):
    if locator[:3] == 'id=':
        return '//*[@id="{}"]'.format(locator[3:])
    return locator[6:].replace("'", '"')  # 6 for xpath=

def get_account_details_code_id(string):
    return {
        u"UA-EDR": u"accountDetailsCode0",
        u"UA-MFO": u"accountDetailsCode1",
        u"accountNumber": u"accountDetailsCode2",
    }.get(string, string)
