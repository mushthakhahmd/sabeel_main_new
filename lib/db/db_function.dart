import 'package:flutter/foundation.dart';
import 'package:sabeel/model/item_model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<Items>> itemsNotifier = ValueNotifier([]);
late Database _db;

Future<void> initializeDatabase() async {
// open the database
  _db = await openDatabase("items.db", version: 1,
      onCreate: (Database db, int version) async {
    // When creating the db, create the table
    // Insert some records in a transaction
    await db.execute(
        'CREATE TABLE Items ( id  INTEGER, cat_id  INTEGER, title  TEXT, subTitle  TEXT, isFavorite  TEXT ,imgUrl  TEXT )');
    //   await insertIntoTable();
  });
}

Future<void> getCount() async {
  // Count the records
  final count =
      Sqflite.firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM Items'));
  if (count! == 0) {
    insertIntoTable();
  }
}

Future<void> insertIntoTable() async {
  await _db.transaction((txn) async {
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'

            '(1,1, "Dua after wake up", "عند الاستيقاظ من النّوم", "false", "assets/pdf/01 Dua after wake up.pdf")'
            '(2,1, "Surah Al-Imran 190-200", "آخر آيات من آل عمران", "false", "assets/pdf/01 Surah Al-Imran 190-200.pdf")'
            '(3,1, "Tahajjud Prayer", "صلاة التهجد", "false", "assets/pdf/01 Tahajjud prayer")'
            '(4,1, "Dua of Asma-Ul-Husna", "دعاء أسماء الله الحسنى", "false", "assets/pdf/01 Dua of Asma-ul-Husna.pdf")'
            '(5,1, "Qaseeda of Imam Haddad", "النفحة العنبرية للإمام الحداد", "false", "assets/pdf/01 Qaseeda of Imam Haddad.pdf")'
            '(6,1, "Wird of Sheikh Abubakar Ibn Salim", "ورد الشيخ أبو بكر بن سالم", "false", "assets/pdf/01 Wird of Sheikh Abubakar.pdf")'
            '(7,1, "Azkar after Thahajjud Prayer", "بعض الأذكار بعد التهجد", "false", "assets/pdf/01 Azkar After the Tahajjud.pdf")'

            '(8,2, "Recite In Sunnah Of Fajr Prayer", "ما يقرأ في سنة الفجر", "false", "assets/pdf/02 Recite In Sunnah of Fajr.pdf")'
            '(9,2, "Zikr After Lying on Right Side", "مع الاضطجاع بعد سنة الفجر", "false", "assets/pdf/02 Zikr After Lying on Right Side.pdf")'
            '(10,2, "Azkar between Fajr Prayer and its Sunnah", "الأذكار بين صلاة الفجر وسنتها", "false", "assets/pdf/02 new Azkar between fajr its sunnah.pdf")'
            '(11,2, "Dua-ul-Fajr of Prophet Before Fajr Prayer", "دعاء الفجر", "false", "assets/pdf/02 Dua-ul-Fajr.pdf")'
            '(12,2, "Ilaika Ya Rabbi Baith After Fajr Prayer", "قصيدة إليك يارب", "false", "assets/pdf/02 Ilaika Ya Rabbi.pdf")'
            '(13,2, "Wird-ul-Latíf of Imam Haddad", "الورد اللطيف للإمام الحداد", "false", "assets/pdf/02 Wird-ul-Latif.pdf")'
            '(14,2, "The Sevens", "المسبّعات", "false", "assets/pdf/02 The sevens.pdf")'
            '(15,2, "Salamat-ul-Iman Dua", "دعاء سلامة الإيمان", "false", "assets/pdf/02 Salamat-ul-iman.pdf")'
            '(16,2, "Swalat-ul-Hulur and Other Azkar", "صلاة الحضور وبعض الأذكار", "false", "assets/pdf/02 Swalat-ul-Hulur.pdf")'
            '(17,2, "Dua After Reciting Surah Al-Fathiha", "كيفية إهداء ثواب سور الفاتحة إلى الصالحين", "false", "assets/pdf/02 Gifting the reward of reciting Surah Fatiha.pdf")'
            '(18,2, "Wird-ul-Imam Nawawi", "ورد الإمام النووي","false", "assets/pdf/02 Wird-ul-Imam Nawawi.pdf")'

            '(19,3, "Azkar After Five Daily Prayers", "الأذكار بعد صلوات الخمس", "false", "assets/pdf/03 Azkar After Five Prayers.pdf")'
            '(20,3, "Surahs in Audible Prayers according to Order", "ترتيب سور الجهرية للإمام الحداد", "false", "assets/pdf/03 Surahs to be Recited Haddad Order.pdf")'


            '(21,4, "Luha Prayer", "صلاة الضحى", "false", "assets/pdf/04 Luha prayer.pdf")'
            '(22,4, "Zikr and Dua after Luha", "الأذكار والدعاء بعد صلاة الضحى", "false", "assets/pdf/04 Zikr and Dua after Luha.pdf")'


            '(23,5, "Four Rak’ahs Sunnah Before Luhr", "أربع ركعات قبل الظهر", "false", "assets/pdf/05 Four Rakahs Before Luhr.pdf")'
            '(24,5, "Four Rak’ahs Sunnah After Luhr", "أربع ركعات بعد الظهر", "false", "assets/pdf/05 Four Rakahs After Luhr.pdf")'
            '(25,5, "Azkar & Dua After Sunnah of Luhr", "الأذكار والدعاء بعد سنة الظهر", "false", "assets/pdf/05 Dua After Sunnah of Luhr.pdf")'
            '(26,5, "Hizb-al-Nasar of Imam Haddad", "حزب النصر للإمام الحداد", "false", "assets/pdf/05 Hizb-al-Nasar of Imam Haddad.pdf")'
            '(27,5, "Hizb-al-Nasar of Imam Shaduli", "حزب النصر للإمام الشاذلي", "false", "assets/pdf/05 Hizb-al-Nasar of Imam Shaduli.pdf")'

            '(28,6, "Four Rak’ahs Before Asar Prayer", "أربع ركعات قبل العصر", "false", "assets/pdf/06 Four Rakahs Before Asar Prayer.pdf")'
            '(29,6, "Hizb-ul-Bahar of Imam Shaduli", "حزب البحر للإمام الشاذلي", "false", "assets/pdf/06 Hizb-ul-Bahar of Imam Shaduli.pdf")'
            '(30,6, "Sayyidul Istigfar", "سيد الاستغفار", "false", "assets/pdf/06 Sayyidul Istigfar in Morning and Evening.pdf")'
            '(31,6, "Azkar Before Magrib", "الأذكار قبل الغروب", "false", "assets/pdf/06 Azkar Before Magrib.pdf")'

            '(32,7, "Two rak’ahs before and after Magrib", "ركعتان قبل صلاة المغرب وبعدها", "false", "assets/pdf/07 Perform two rakahs Sunnah magrib.pdf")'
            '(33,7, "Janaza Prayer upon who died on that day", "صلاة الميت لمن مات ذاك اليوم", "false", "assets/pdf/07 Janaza Prayer.pdf")'
            '(34,7, "Awwabín Prayer", "صلاة الأوابين", "false", "assets/pdf/07 Awwabin Prayer.pdf")'
            '(35,7, "Saif-ul-Yamâni Dua", "دعاء سيف اليماني", "false", "assets/pdf/07 Saif-ul-Yamani Dua.pdf")'
            '(36,7, "Aqeeda for Strengethining Your Faith", "عقيدة الإمام أبي بكر السكران", "false", "assets/pdf/07 Aqeeda for Faith.pdf")'

            '(37,8, "Surah Yasín", "سورة يس", "false", "assets/pdf/08 Surah Yasin.pdf")'
            '(38,8, "Dua of Surah Yasín", "دعاء سورة يس", "false", "assets/pdf/08 Dua of Surah Yasin.pdf")'
            '(39,8, "Surah Al-Waqia", "سورة الواقعة ", "false", "assets/pdf/08 Surah Al-Waqia.pdf")'
            '(40,8, "Dua of Surah Al-Waqia", "دعاء سورة الواقعة ", "false", "assets/pdf/08 Dua of Surah Al-Waqia.pdf")'
            '(41,8, "Surah Al-Sajda", "سورة السجدة", "false", "assets/pdf/08 Surah Al-Sajda.pdf")'
            '(42,8, "Surah Al-Mulk", "سورة الملك", "false", "assets/pdf/08 Surah Al-Mulk.pdf")'
            '(43,8, "Surah Ad-Dukhan", "سورة الدخان", "false", "assets/pdf/08 Surah Ad-Dukhan.pdf")'
            '(44,8, "Three Ayath from Surah Al-Hashr", "آخر آيات من سورة الحشر", "false", "assets/pdf/08 Three Ayath.pdf")'

            '(45,9, "Two rak’ahs before Isha & its Dua", "ركعتان قبل صلاة العشاء", "false", "assets/pdf/09 before Isha Prayer & Dua.pdf")'
            '(46,9, "Two rak’ahs after Isha & its Dua", "ركعتان بعد صلاة العشاء", "false", "assets/pdf/09 after Isha Prayer & Dua.pdf")'
            '(47,9, "Ratib-ul-Haddad", "راتب الإمام الحداد", "false", "assets/pdf/09 Ratib-ul-Haddad.pdf")'
            '(48,9, "Ratib-ul-Attas", "راتب الإمام العطاس", "false", "assets/pdf/09 Ratib-ul-Attas.pdf")'
            '(49,9, "Witr Prayer", "صلاة الوتر", "false", "assets/pdf/09 Witr Prayer.pdf")'
            '(50,9, "Zikr & Dua After Witr Prayer", "الأذكار والدعاء بعد صلاة الوتر", "false", "assets/pdf/09 Zikr & Dua After Witr Prayer.pdf")'
            '(51,9, "Long Qunut", "القنوت الكبير", "false", "assets/pdf/09 Long Qunut.pdf")'

            '(52,10, "Zikr & Ayahs Before Sleeping", "الأذكار والآيات قبل الظهر", "false", "assets/pdf/10 Zikr & Ayahs Before Sleeping.pdf")'
            '(53,10, "To Make a daily routine", "واظبوا كل يوم", "false", "assets/pdf/10 To Make a daily routine.pdf")'

            '(54,11, "Awrad of Friday", "أوراد يوم الجمعة", "false", "assets/pdf/11 Awrad of Friday.pdf")'
            '(55,11, "Ilahí Nas’aluka Baith", "قصيدة إلهي نسألك", "false", "assets/pdf/11 Ilahi Nas aluka Baith.pdf")'
            '(56,11, "Qad Kafani Baith", "قصيدة قد كفاني", "false", "assets/pdf/11 Qad Kafani Baith.pdf")'
            '(57,11, "Surah Al-kahf", "سورة الكهف", "false", "assets/pdf/11 Surah Al-kahf.pdf")'
            '(58,11, "Recite Seven Times After Jumua", "يقرأ بعد صلاة الجمعة سبعا", "false", "assets/pdf/11 Recite Seven Times After Jumua.pdf")'
            '(59,11, "Qaseeda For Strengthening Faith", "إلهي لست للفردوس", "false", "assets/pdf/11 Qaseeda For Strengthening Faith.pdf")'
            '(60,11, "100 Thasbeeh after Jumua", "التسبيح", "false", "assets/pdf/11 100 Thasbeeh after Jumua.pdf")'
            '(61,11, "Seven Times To Get rid of Debt", "سبعون مرة لقضاء الدين", "false", "assets/pdf/11 To Get rid of Debt.pdf")'
            '(62,11, "Swalath After Friday Asar", "الصلوات بعد عصر يوم الجمعة", "false", "assets/pdf/11 Swalath After Friday Asar.pdf")'

            '(63,12, "After Drinking", "بعد شرب الماء", "false", "assets/pdf/12 After Drinking.pdf")'
            '(64,12, "After Eating", "بعد الأكل", "false", "assets/pdf/12 After Eating.pdf")'
            '(65,12, "After the First Salam of Prayer", "بعد التسليمة الأولى من الصلاة", "false", "assets/pdf/12 After First Salam.pdf")'
            '(66,12, "After the Second Salam of Prayer", "بعد التسليمة الثانية من الصلاة", "false", "assets/pdf/12 After Second Salam.pdf")'
            '(67,12, "After Sneezing", "بعد العطاس", "false", "assets/pdf/12 After Sneezing.pdf")'
            '(68,12, "After Waking up", "إذا استيقظ من النوم", "false", "assets/pdf/12 After Waking up.pdf")'
            '(69,12, "After Washing", "بعد الاستنجاء", "false", "assets/pdf/12 After Washing.pdf")'
            '(70,12, "Baith and Ayath at the End of Majlis and Class", "القصيدة التي تقرأ في آخر المجالس", "false", "assets/pdf/12 Baith at the End of Majlis.pdf")'
            '(71,12, "Before Wearing New Dress, etc", "لـمن لبس الثوب الجديد", "false", "assets/pdf/12 Before Wearing New..pdf")'
            '(72,12, "By Raising Hands towards the sky after Ablution", "بعد الوضوء مع رفع اليدين إلى السماء", "false", "assets/pdf/12 after Ablusion.pdf")'
            '(73,12, "Congratulating the Bridegroom", "", "false", "assets/pdf/12 Congratulating the Bridegroom.pdf")'
            '(74,12, "Dua after the Two Rak’ah Sunnah Before the Sexual Intercourse", "", "false", "assets/pdf/12 Dua Before the Sexual Intercourse.pdf")'
            '(75,12, "Dua Before Dispersing the Gathering", "قبل المفارقة من المجالس", "false", "assets/pdf/12 Dua before Dispersing the Gathering.pdf")'
            '(76,12, "Dua in the Begining of Class And Reading", "دعاء يقرأ في بداية الدروس والمطالعة", "false", "assets/pdf/12 Dua in the Begining of Class And in the Begining of Reading.pdf")'
            '(77,12, "Dua Between Azaan And Iqamah", "الدعاء بين الأذان والإقامة", "false", "assets/pdf/12 Dua  Between Azaan And Iqamah.pdf")'
            '(78,12, "Dua of Tawba Prayer", "دعاء صلاة التوبة", "false", "assets/pdf/12 Dua of Tawba Prayer.pdf")'
            '(79,12, "Dua after five prayers for easy completion of home", "الدعاء الذي يقرأ بعد كل صلاة لسهولة المنزل", "false", "assets/pdf/12 Dua to habituate after five times prayer of home.pdf")'
            '(80,12, "During Ejaculation", "", "false", "assets/pdf/12 During Ejaculation.pdf")'
            '(81,12, "During one’s first meeting with his wife", "", "false", "assets/pdf/12 During ones first meeting with his wife.pdf")'
            '(82,12, "During Pregnency", "عند الحمل", "false", "assets/pdf/12 During Pregnency.pdf")'
            '(83,12, "During the Intercourse", "", "false", "assets/pdf/12 During the Intercourse.pdf")'
            '(84,12, "Especially after FajrAzaan", "بعد أذان الصبح خاصة", "false", "assets/pdf/12 Especially after Fajr Azaan.pdf")'
            '(85,12, "Especially after MagribAzaan", "بعد أذان المغرب خاصة", "false", "assets/pdf/12 Especially after Magrib Azaan.pdf")'
            '(86,12, "Especially in FajrAzaan", "في أذان الصبح خاصة", "false", "assets/pdf/12 Especially in Fajr Azaan.pdf")'
            '(87,12, "Form of Calling Name of the Baby", "كيفية تسمية  الولد", "false", "assets/pdf/12 Form of Calling a Name of the Baby.pdf")'
            '(88,12, "Form of Calling Fatiha in New Home", "كيفية قراءة سورة الفاتحة في المنزل الجديد", "false", "assets/pdf/12 Form of Calling Surah Fatiha in New Home.pdf")'
            '(89,12, "If Something Surprises you", "إذا أعجبك شيء", "false", "assets/pdf/12 If Something Surprises you.pdf")'
            '(90,12, "If you Fall into a Ditch, etc", "إذا سقط في الحفر", "false", "assets/pdf/12 If you Fall into a Ditch.pdf")'
            '(91,12, "If you Find Difficult To Get out of your Debts", "إذا عسر قضاء الدين", "false", "assets/pdf/12 If you Find it Difficult Debts.pdf")'
            '(92,12, "If you Find Difficult to Reach your Goal", "إذا ضاق حصول المقصود", "false", "assets/pdf/12 If you Find it Difficult to Reach your Goal.pdf")'
            '(93,12, "If You Hear the News of the Death of a Muslim", "إذا سمع نعي المؤمن", "false", "assets/pdf/12 If You Hear Death of a Muslim.pdf")'
            '(94,12, "In Case of Disaster", "إذا أصيب بمصيبة", "false", "assets/pdf/12 In Case of Disaster.pdf")'
            '(95,12, "In Iqamah", "في الإقامة", "false", "assets/pdf/12 In Iqamah.pdf")'
            '(96,12, "In the Beginning of any Good Thing", "في بداية كل خير", "false", "assets/pdf/12 In the Beginning of any Good Thing.pdf")'
            '(97,12, "Istikharath Prayer and Dua", "صلاة الاستخارة ودعاءها", "false", "assets/pdf/12 Istikharath Prayer and Dua.pdf")'
            '(98,12, "Nahs Days of Every Month", "أيام النحس المكررة في كل شهر", "false", "assets/pdf/12 Nahs Days of Every Month.pdf")'
            '(99,12, "Nahs of Various Months", "أيام النحس المخصوصة بكل شهر", "false", "assets/pdf/12 Nahs of Various Months.pdf")'
            '(100,12, "Nikah Khutuba", "", "false", "assets/pdf/12 Nikah Khutuba.pdf")'
            '(101,12, "Niyyah While Teaching And Studying", "نية التعلم والتعليم", "false", "assets/pdf/12 Niyyah to Recite While Teaching.pdf")'
            '(102,12, "Prophetic Dua for Healing", "عند عيادة المريض", "false", "assets/pdf/12 Prophetic Dua for Healing.pdf")'
            '(103,12, "Some Ayahs to Cure Illness", "آيات الشفاء", "false", "assets/pdf/12 Some Ayahs to Cure Illness.pdf")'
            '(104,12, "Sujood-u-Thilawath", "سجود التلاوة", "false", "assets/pdf/12 Sujood-u-Thilawath.pdf")'
            '(105,12, "Tasbíh Prayer", "صلاة التسبيح", "false", "assets/pdf/12 Tasbih Prayer.pdf")'
            '(106,12, "Tawba Prayer", "صلاة التوبة", "false", "assets/pdf/12 Tawba Prayer.pdf")'
            '(107,12, "Things to Do When a New Baby is Born", "ما يعمل للولد الجديد", "false", "assets/pdf/12 Things to Do When a New Baby is Born.pdf")'
            '(108,12, "To Become Childbirth Easier", "لسهولة وضع الحمل", "false", "assets/pdf/12 To Become Childbirth Easier.pdf")'
            '(109,12, "To Chant in Sujood-u-Shukr", "سجود الشكر", "false", "assets/pdf/12 To Chant in Sujood-u-Shukr.pdf")'
            '(110,12, "When Starting to Live in a New Home", "ما يقرأ في المنزل الجديد", "false", "assets/pdf/12 To Chant When Starting to Live in a New Home.pdf")'
            '(111,12, "To Get Included among Good People", "", "false", "assets/pdf/12 To Get Included among Good People (At Fajr).pdf")'
            '(112,12, "To One Who Wears New Dress", "لـمن لبس الثوب الجديد", "false", "assets/pdf/12 To One Who Wears New Dress.pdf")'
            '(113,12, "To See What you wished for Your Family", "لرؤية ما رجوناه في الزوجة والأولاد", "false", "assets/pdf/12 To see what you wished for Your Family.pdf")'
            '(114,12, "When Combing Beard", "عند تمشيط اللحية", "false", "assets/pdf/12 When Combing Beard.pdf")'
            '(115,12, "When Entering into Bathroom", "عند الدخول إلى المستحم", "false", "assets/pdf/12 When Entering into Bathroom.pdf")'
            '(116,12, "When Entering into Home", "عند دخول المنزل", "false", "assets/pdf/12 When Entering into Home.pdf")'
            '(117,12, "When Entering Masjid", "عند الدخول إلى المسجد", "false", "assets/pdf/12 When Entering Masjid.pdf")'
            '(118,12, "When Entering To an Unoccupied Place", "عند الدخول إلى المكان الخالي", "false", "assets/pdf/12 When Entering To an Unoccupied Place.pdf")'
            '(119,12, "When Facing Diffuculty with Vomiting", "إذا ضاقت الحامل بالقيء", "false", "assets/pdf/12 When Facing Diffuculty with Vomiting.pdf")'
            '(120,12, "When Finishing from Azaan", "عند الفراغ من الأذان", "false", "assets/pdf/12 When Finishing from Azaan.pdf")'
            '(121,12, "When Getting angry", "عند الغضب", "false", "assets/pdf/12 When Getting angry.pdf")'
            '(122,12, "When Going to Masjid", "", "false", "assets/pdf/12 When Going to Masjid.pdf")'
            '(123,12, "When Hearing Azaan", "جواب الأذان", "false", "assets/pdf/12 When Hearing Azaan.pdf")'
            '(124,12, "When It Rains", "عند المطر", "false", "assets/pdf/12 When It Rains.pdf")'
            '(125,12, "When Leaving Home", "عند الخروج من المنزل", "false", "assets/pdf/12 When Leaving Home.pdf")'
            '(126,12, "When Looking at the Sky", "عند النظر إلى السماء", "false", "assets/pdf/12 When Looking at the Sky.pdf")'
            '(127,12, "When Looking into a Mirror", "عند النظر إلى المرآة", "false", "assets/pdf/12 When Looking into a Mirror.pdf")'
            '(128,12, "When Returning from Masjid", "عند الخروج من المسجد", "false", "assets/pdf/12 When Returning from Masjid.pdf")'
            '(129,12, "When Returning from Toilet", "عند الخروج من الخلاء", "false", "assets/pdf/12 When Returning from Toilet.pdf")'
            '(130,12, "When Sighting the New Moon", "عند رؤية الهلال", "false", "assets/pdf/12 When Sighting the New Moon.pdf")'
            '(131,12, "When Undressing", "عند نزع الثوب", "false", "assets/pdf/12 When Undressing.pdf")'
            '(132,12, "When Using Perfume", "عند شمّ العطر", "false", "assets/pdf/12 When Using Perfume.pdf")'
            '(133,12, "When Visiting a Patient", "عند عيادة المريض", "false", "assets/pdf/12 When Visiting a Patient.pdf")'
            '(134,12, "When Wearing Dress", "عند لبس الثوب", "false", "assets/pdf/12 When Wearing Dress.pdf")'
            '(135,12, "While Donating", "عند التصدق", "false", "assets/pdf/12 While Donating.pdf")'
            '(136,12, "While Drinking Milk", "عند شرب اللبن", "false", "assets/pdf/12 While Drinking Milk.pdf")'
            '(137,12, "While Drinking Zamzam Water", "عند شرب ماء زمزم", "false", "assets/pdf/12 While Drinking Zamzam Water.pdf")'
            '(138,12, "While Entering Toilet", "عند دخول الخلاء", "false", "assets/pdf/12 While Entering Toilet.pdf")'
            '(139,12, "While Facing Difficulties", "عند الكرب", "false", "assets/pdf/12 While Facing Difficulties.pdf")'
            '(140,12, "While paying off the debt", "", "false", "assets/pdf/12 While paying off the debt.pdf")'
            '(141,12, "While Shaking Hands with Each other", "عند المصافحة", "false", "assets/pdf/12 While Shaking Hands.pdf")'
            '(142,12, "While Thundering", "عند الرعد", "false", "assets/pdf/12 While Thundering.pdf")'
            '(143,12, "While Yawning", "عند التثاؤب", "false", "assets/pdf/12 While Yawning.pdf")'

            //
            // '(1,14, "Salam Baith", "قصيدة السّلام عليك", "false", "14 sharrafal anam moulid.pdf")'
            // '(1,14, "Sharrafal Anam Moulid", "مولد شرف الأنام", "false", "04 Luha prayer.pdf")'
            // '(1,14, "Manqoos Moulid", "المولد المنقوص", "false", "14 Manqoos Moulid.pdf")'
            // '(1,14, "Barzanji Moulid", "مولد البرزنجي", "false", "14 Barzanji Moulid.pdf")'
            // '(1,14, "Badr Moulid", "مولد بدر", "false", "14 Badr Moulid.pdf")'
            // '(1,14, "Amladul Gusnain moulid", "مولد أملد الغصنين مختصر مولد الحسنين", "false", "14 Amladul Gusnain moulid.pdf")'
            // '(1,14, "Muhyidheen Moulid", "مولد محي الدين", "false", "14 Muhyidheen Moulid.pdf")'
            //
            //
            // '(1,15, "Qaseedat-ul Burda", "قصيدة البردة", "false", "15 Qaseedat-ul Burda of Imam Busweeri.pdf")'
            // '(2,15, "Qaseedat-ul Mulariyya", "القصيدة المضرية", "false", "15 Qaseedat-ul Mulariyya of Imam Busweeri.pdf")'
            // '(3,15, "Qaseedath-ul Muhammadiyya", "القصيدة المحمدية", "false", "15 Qaseedath-ul Muhammadiyya.pdf")'
            // '(4,15, "Qaseedat-ul Witriyya", "قصائد الوترية", "false", "15 Qaseedat-ul Witriyya.pdf")'
            // '(5,15, "Qaseeda Swallal Ilah", "قصيدة صلى الإله", "false", "15 Qaseeda Swallal Ilah of Sheikh.pdf")'
            // '(6,15, "Qaseeda Ahmadullahil Wali", "قصيدة  أحمد الله الولي", "false", "15 Qaseeda Ahmadullahil Wali.pdf")'
            // '(7,15, "Qaseeda Written on The Wall of Raula", "القصيدة المكتوبة في جدران الروضة", "false", "15 Qaseeda Written on The Wall.pdf")'
            // '(8,15, "Sayyidatuna Khadeeja Tawassul", "التوسل بسيدتنا خديجة الكبرى", "false", "15 Sayyidatuna Khadeeja Tawassul.pdf")'
            // '(9,15, "Sayyidatuna Fatima Tawassul", "التوسل بسيدتنا فاطمة الزهراء", "false", "15 Sayyidatuna Fatima Tawassul.pdf")'
            // '(10,15, "Sayyidatuna Mariyam Tawassul", "التوسل بسيدتنا مريم", "false", "15 Sayyidatuna Mariyam Tawassul.pdf")'
            // '(11,15, "Al-Qutbiyya", "القطبية للشيخ صدقة الله القاهري", "false", "15 Al-Qutbiyya.pdf")'
            // '(12,15, "Al-Mahlaratul Badriyya", "المحضرة البدرية", "false", "15 Al-Mahlaratul Badriyya.pdf")'
            // '(13,15, "Tha’ajeelul futhooh", "تعجيل الفتوح", "false", "15 Thaajeelul futhooh.pdf")'
            // '(14,15, "Majlisunnoor", "مجلس النور", "false", "15 Majlisunnoor.pdf")'
            // '(15,15, "Al-Qaseedatul Qamriyya", "القصيدة الخمرية", "false", "15 Al-Qaseedatul khamriyya.pdf")'
            // '(16,15, "Qaseeda of Sheikh Jifri Calicut", "قصيدة دفع البلاء للشيخ الجفري الكالكوتي", "false", "15 Qaseeda of Sheikh Jifri Calicut.pdf")'
            // '(17,15, "Qaseeda Ajmeeriyya", "القصيدة الأجميرية", "false", "15 Qaseeda Ajmeeriyya.pdf")'
            // '(18,15, "Ajmeer Khwaja Madh", "تحفة المحبين في مدح سلطان الهند ", "false", "15 Ajmeer Khwaja Madh.pdf")'
            // '(19,15, "C.M Waliyyullah TawassulBaith", "التوسل بولي الله سي يم المدووري", "false", "15 C.M Waliyyullah Tawassul Baith.pdf")'
            // '(20,15, "Aaramba Poovaya Baith", "نشيدة الشيخ الكندوري في مدح الحبيب", "false", "15 Aaramba Poovaya Baith.pdf")'


    );
  });
}

Future<void> getItems(int id) async {
  itemsNotifier.value.clear();

  final _values =
      await _db.rawQuery(' SELECT * FROM Items  WHERE cat_id = ?', [id]);

  print(_values);

  _values.forEach((item) {
    //final  Items.fromJson(item);
    final items = Items.fromJson(item);

    itemsNotifier.value.add(items);
    itemsNotifier.notifyListeners();

    print(itemsNotifier.value);
  });
}

Future<void> updateFavorite(int id, String value) async {
  final _values = await _db.rawQuery(
      ' UPDATE Items SET  isFavorite =?  WHERE   id = ?', [value, id]);
  itemsNotifier.notifyListeners();
}
