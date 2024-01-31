//
//  SetupLanguageChange.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 12/14/23.
//

import Foundation

var routineAlertTitle = ""
let routineAlertTitleEnglish = "Reminder"
let routineAlertTitleTurkish = "Hatırlatma"

var routineReminderMessage = ""
let routineReminderMessageEnglish = "Please update your daily routine."
let routineReminderMessageTurkish = "Lütfen günlük rutininizi güncelleyin."

var languageName = ""
let english = "English"
let turkish = "Turkish"

var cancelIptal = ""
let CancelEnglish = "Cancel"
let CancelTurkish = "İptal"

var saveKaydet = ""
let saveKaydetEnglish = "Save"
let saveKaydetTurkish = "Kaydet"

var yesEvet = ""
let yesEnglish = "Yes"
let YesTurkish = "Evet"

//Settings
var settingsDescription = ""
let descriptionEnglish = "You can select the language you want to use for the application using the picker located in the top right corner of the page. Additionally, you can receive in-app reminders about your daily routines by using the switch under the 'Routine Reminder' option. Finally, by clicking the 'Factory Reset' button at the bottom of the page, you can delete all stored data and restore your application to its initial setup."
let descriptionTurkish = "Uygulamada kullanmak istediğiniz dili, sayfanın sağ üst köşesinde bulunan dil butonunu kullanarak seçebilirsiniz. Ayrıca, 'Rutin Hatırlatma' seçeneği altındaki anahtarı kullanarak günlük rutinlerinizle ilgili uygulama içi hatırlatmalar alabilirsiniz. Son olarak, sayfanın alt kısmında bulunan 'Factory Reset' butonuna tıklayarak, tüm depolanan verileri silip uygulamanızı başlangıç ​​kurulumuna geri döndürebilirsiniz."

var reminderLabel = ""
let reninderLabelTextEnglish = "Routine Reminder"
let reninderLabelTextTurkish = "Rutin Hatırlatma"


var showDeleteAlertTitle = ""
let showDeleteAlertTitleEnglish = "Caution"
let showDeleteAlertTitleTurkish = "Dikkat"

var showDeleteAlertMessage = ""
let showDeleteAlertMessageEnglish = "When you click the reset button, all your saved data will be permanently erased and cannot be recovered."
let showDeleteAlertMessageTurkish = "Reset butonuna tıkladığınızda, tüm kayıtlı verileriniz kalıcı olarak silinecek ve geri getirilemeyecek."


var areYouSureTitle = ""
let areYouSureEnglish = "Are You Sure"
let areYouSureTurkish = "Emin misiniz?"

var settingsLanguage = ""
let settingsLanguageEnglish = "Language"
let settingsLanguageTurkish = "Dil Seçimi"

var settingsToolTips = ""
let settingsToolTipsEnglish = "Tool Tips"
let settingsToolTipsTurkish = "İpucu"


//TabelViewCells

var zikirCellName = ""
let zikirEnglish = "Dhikr"
let zikirTurkish = "Zikir"

var prayerCellName = ""
let parayerEnglish = "Prayer"
let prayerTurkish = "Namaz"

var readingCellName = ""
let readingEnglish = "Reading"
let readingTurkish = "Okuma"

var routineButtonName = ""
let routineButtonNameEnglish = "Routine"
let routineButtonNameTurkish = "Rutin"

var selectLanguage = ""
let selectLanguageEnglish = "Select Language"
let selectLanguageTurkish = "Dil Seç"

var selectLanguageDescription = ""
let selectLanguageDescriptionEnglish = "Choose your preferred language"
let rselectLanguageDescriptionTurkish = "Hangi dilde kullanmak istediginizi seçin"

var routineCellImageNamed = ""
let routineCellImageNamedEnglish = "routineEnglish"
let routineCellImageNamedTurkish = "routineTurkish"

// ROUTINE TIPS POPOVER
var routineTips = ""
let routineTipsEnglish = "ROUTINE"
let routineTipsTurkish = "RUTİN"

var popoverAddDeleteLabel = ""
let popoverAddDeleteLabelEnglish  = "Adding/Deleting a new 'Routine'"
let popoverAddDeleteLabelTurkish  = "Yeni bir 'Rutin' eklemek/silmek"

var popoverAddDeleteDescription = ""
let popoverAddDeleteDescriptionEnglish  = """
           To establish your routine, click on the '+' button located in the top left corner of the page. Then, fill in the fields for 'Routine Name' and 'Your Goal.' Next, use the selector at the bottom to choose the category of your routine and click the 'Add' button. Your added routine will appear on the screen.

           If the category of the routine you added is 'Zikir' a counter corresponding to this remembrance will be automatically created in the 'Counter' page.

           Finally, if you wish to delete an added routine, swipe it from right to left and tap the appearing 'Delete' button. This action will permanently erase the routine along with all its data. Remember, deleting a routine in the 'Remembrance' category will also remove it from the 'Counter' page.
"""
let popoverAddDeleteDescriptionTurkish  = """
Günlük rutininizi oluşturmak için sayfanın sol üst köşesindeki '+' butonuna tıklayın. Ardından, 'Rutin Adı' ve 'Hedefiniz' alanlarını doldurun. Sonra, rutininizin kategorisini seçmek için sayfanın altındaki seçiciyi kullanın ve 'Ekle' düğmesine tıklayın. Eklediğiniz rutin ekranınızda görünecektir.

Eklediğiniz rutinin kategorisi 'Zikir' ise, zikiriniz otomatik olarak 'Sayaç' sayfasında oluşturulacaktır.

Son olarak, eklenen bir rutini silmek isterseniz, sağdan sola kaydırın ve çıkan 'Sil' düğmesine dokunun. Bu işlem rutini ve tüm verilerini kalıcı olarak silecektir. Unutmayın, Rutini sildiginizde ilgili rutin 'Sayaç' sayfasından da kaldıracaktır.
"""

var popoverUpdateLabel = ""
let popoverUpdateLabelEnglish  = "Updateing a routine"
let popoverUpdateLabelTurkish  = "Rutini Güncelleme"

var popoverUpdateDescription = ""
let popoverUpdateDescriptionEnglish  = """
            Your 'Zikir' routines' 'Now' values are automatically calculated based on your interactions with the corresponding counters on the counter page; you cannot change them from here.
            For 'Prayer' and 'Reading' routines, you need to manually update them by selecting values from the picker.
            If you want to change the Goal values of your routines, you can do so by clicking on the icon of the routine you wish to modify.
            Based on the values you input here, your daily and weekly reports will be generated.
           """
let popoverUpdateDescriptionTurkish  = """
Zikir' rutinlerinizin 'Mevcut' değerleri, sayaç sayfasındaki karşılık gelen sayaçlarla olan etkileşimlerinize dayalı olarak otomatik olarak hesaplanır; bunları buradan değiştiremezsiniz.
'Namaz' ve 'Okuma' rutinleri için, onları manuel olarak güncellemeniz gerekmektedir. Bunun için değerleri seçici yardımıyla seçmelisiniz.
Rutinlerinizin Hedef değerlerini değiştirmek isterseniz, değiştirmek istediğiniz rutinin simgesine tıklayarak yapabilirsiniz.
Burada girdiğiniz değerlere göre günlük ve haftalık raporlarınız oluşturulacaktır.
"""


var libraryTips = ""
let libraryTipsEnglish = "LIBRARY"
let libraryTipsTurkish = "KÜTÜPHANE"

var popoverAddDeleteLabelBookStore = ""
let popoverAddDeleteLabelBookStoreEnglish  = "Adding a new book"
let popoverAddDeleteLabelBookStoreTurkish  = "Yeni bir 'Kitap' eklemek"

var popoverAddDeleteDescriptionBookStore = ""
let popoverAddDeleteDescriptionBookStoreEnglish  = """
            To add a book with a PDF extension to your library, you can click on the 'Add Document' button at the top of the page. The system only accepts files with a PDF extension.
           """
let popoverAddDeleteDescriptionBookStoreTurkish  = """
Kütüphanenize PDF uzantılı bir kitabı eklemek için, sayfanın üst kısmında bulunan 'Belge Ekle' butonuna tıklayabilirsiniz. Sistem yalnızca PDF uzantılı dosyaları kabul eder.
"""

var popoverUpdateLabelBookStore = ""
let popoverUpdateLabelBookStoreEnglish  = "Removing a book"
let popoverUpdateLabelBookStoreTurkish  = "Eklenen kitabı kaldırma"

var popoverUpdateDescriptionBookStore = ""
let popoverUpdateDescriptionBookStoreEnglish  = """
    To delete a book from your library, you should swipe the book cover from right to left and click on the 'delete' button that appears. This way, you can delete the books you've added one by one. Please note that you can only delete the books you've added yourself, and once deleted, you won't be able to use the book again without re-uploading it.
"""
let popoverUpdateDescriptionBookStoreTurkish  = """
Kütüphanenizden bir kitabı silmek için, kitap kapağını sağdan sola doğru kaydırıp ortaya çıkan 'sil' düğmesine tıklayabilirsiniz. Bu şekilde, eklediğiniz kitapları tek tek silebilirsiniz. Unutmayın sadece kendinizin eklediği kitapları silebilirsiniz.
"""


var zikirTips = ""
let zikirTipsEnglish = "ZİKİR"
let zikirTipsTurkish = "ZİKİR"

var zikirPopoverAddLabel = ""
let zikirPopoverAddLabelEnglish  = "Adding a new zikir"
let zikirPopoverAddLabelTurkish  = "Yeni bir zikir eklemek"

var zikirPopoverAddDescription = ""
let zikirPopoverAddDescriptionEnglish  = """
           You can add a new zikir by clicking the "+" button at the bottom of the opened window.
           """
let zikirPopoverAddDescriptionTurkish  = """
Yeni bir zikir eklemek için açılan pencerenin altındaki '+' butonuna tıklayabilirsiniz.
"""

var zikirPopoverDeleteLabel = ""
let zikirPopoverDeleteLabelEnglish  = "Removing a zikir"
let zikirPopoverDeleteLabelTurkish  = "Eklenen Zikiri Silme"

var zikirPopoverDeleteDescription = ""
let zikirPopoverDeleteDescriptionEnglish  = """
           To delete a zikir you've added, you need to swipe the dhikr from right to left and press the 'delete' button that appears. This way, you can delete the dhikrs you've added one by one. Please remember that you can only delete the dhikrs you've added yourself. Also, keep in mind that once you delete a dhikr, all data associated with that dhikr will be permanently removed.
           """
let zikirPopoverDeleteDescriptionTurkish  = """
Eklediğiniz bir zikiri silmek için sağadan sola kaydırıp ortaya çıkan 'sil' butonuna dokunmanız gerekiyor. Bu şekilde eklediğiniz zikirleri tek tek silebilirsiniz. Lütfen unutmayın, sadece kendinizin eklediği zikirleri silebilirsiniz. Ayrıca, bir zikiri sildiğinizde o zikirle ilişkili tüm veriler kalıcı olarak silinecektir.
"""

var zikirResetRoutine = ""
let zikirResetRoutineEnglish = "Reseting a counter"
let zikirResetRoutineTurkish = "Sayacı Sıfırlama"

var zikirResetDescriptionRoutine = ""
let zikirResetDescriptionRoutineEnglish = """
            By pressing and holding the Counter button on the Counter page for a few seconds, you can reset the zikir values.
           """
let zikirResetDescriptionRoutineTurkish = """
Sayaç butonuna birkaç saniye basılı tutarak zikir değerlerini sıfırlayabilirsiniz.
"""

var pickerSelect = ""
let pickerSelectEnglish = "Select"
let pickerSelectTurkish = "Seçim"

var pickerZikir = ""
let pickerZikirEnglish = "Dhikr"
let pickerZikirTurkish = "Zikir"

var pickerPrayer = ""
let pickerPrayerEnglish = "Prayer"
let pickerPrayerTurkish = "Namaz"

var pickerReading = ""
let pickerReadingEnglish = "Reading"
let pickerReadingTurkish = "Okuma"

var alertUpdateRoutine = ""
let alertUpdateRoutineEnglish  = "Update Routine"
let alertUpdateRoutineTurkish  = "Rutinini Güncelle"

var alertUpdateRoutineMessage = ""
let alertUpdateRoutineMessageEnglish  = "Please enter the Daily Goal of routine in the designated field."
let alertUpdateRoutineMessageTurkish  = "Lütfen rutinin günlük hedefini belirtilen alana girin."

var dailyGoalPHolder = ""
let dailyGoalPHolderEnglish  = "Daily Goal"
let dailyGoalPHolderTurkish  = "Günlük Hedefin"

var updateTitle = ""
let updateTitleEnglish  = "Update"
let updateTitleTurkish  = "Güncelleme"

var updatemessageRoutine = ""
let updatemessageRoutineEnglish  = "Please make sure all fields are completed"
let updatemessageRoutineTurkish  = "Lütfen tüm alanların doldurulduğundan emin olun."

var errorMesaageNotFound = ""
let errorMesaageNotFoundEnglish  = "Routine not found"
let errorMesaageNotFoundTurkish  = "Rutin bulunamadı"

var errorMessageNotRead = ""
let uerrorMessageNotReadEnglish  = "Data was not read."
let errorMessageNotReadTurkish  = "Data Okunamadı"

var alertTitleError = ""
let alertTitleErrorEnglish  = "Error"
let alertTitleErrorTurkish  = "Hata"

var alertMessageError = ""
let alertMessageErrorEnglish  = "Please make sure all fields are completed and select a category"
let alertMessageErrorTurkish  = "Lütfen tüm alanların doldurulduğundan ve bir kategori seçildiğinden emin olun."

var alertMessageRoutineNameError = ""
let alertMessageRoutineNameErrorEnglish  = "The routine name is already taken. Please enter a new name."
let alertMessageRoutineNameErrorTurkish  = "Bu rutin adı zaten alınmış. Lütfen yeni bir ad girin."

var popoverYourGoal = ""
let popoverYourGoalEnglish = "Your Daily Goal"
let popoverYourGoalTurkish = "Günlük Hedefin"

var popoverroutineName = ""
let popoverroutineNameEnglish = "Routine Name"
let popoverroutineNameTurkish = "Rutin Adı"

var deleteZikirRoutine = ""
let deleteZikirRoutineEnglish  = "Delete Zikir"
let deleteZikirRoutineTurkish  = "Zikiri Sil"

var deleteZikirMessageRoutine = ""
let deleteZikirMessageRoutineEnglish  = "Do you want to delete this routine permanently?"
let deleteZikirMessageRoutineTurkish  = "Bu rutini kalıcı olarak silmek istiyor musunuz?"

var cancelTitleRoutine = ""
let cancelTitleRoutineEnglish  = "Cancel"
let cancelTitleRoutineTurkish  = "İptal"

var yesEvetRoutine = ""
let yesEvetRoutineEnglish = "Yes"
let yesEvetRoutineTurkish = "Evet"

var IamSorryMessageRoutine = ""
let IamSorryMessageRoutineEnglish = "I'm sorry, you cannot delete zikir from this tab."
let IamSorryMessageRoutineTurkish = "Üzgünüm, bu sekmeden zikiri silemezsiniz."

var toolTipRoutine = ""
let toolTipRoutineEnglish = """
             
           Firstly, click on the '+' icon located at the top right corner of the page to create your routine.

           The 'Now' values for your 'Zikir' routines are automatically calculated based on your interactions with the corresponding counters on the counter page; you cannot change them from here.

           For 'Prayer' and 'Reading' routines, you'll need to manually make updates. Use the picker to select values.

           If you wish to change the Goal values of your routines, click on the icon of the routine you want to modify.

           Your daily and weekly reports will be generated based on the values you input here.
          """
let toolTipRoutineTurkish = """
İlk olarak, rutininizi oluşturmak için sayfanın sağ üst köşesindeki '+' simgesine tıklayın.

'Zikir' rutinlerinizin 'Mevcut' değerleri, sayaç sayfasındaki ilgili sayaçlarla etkileşiminize göre otomatik olarak hesaplanır; bunları buradan değiştiremezsiniz.

'Namaz' ve 'Okuma' rutinleri için, güncelleme yapmak isterseniz manuel olarak yapmanız gerekecek. Değerleri girmek için seçiciyi kullanın.

Rutinlerinizin Hedef değerlerini değiştirmek isterseniz, değiştirmek istediğiniz rutinin simgesine tıklayın.

Günlük ve haftalık raporlarınız burada girdiğiniz değerlere göre oluşturulacaktır.
"""

var okRoutine = ""
let okRoutineEnglish = "Ok"
let okRoutineTurkish = "Tamam"



func updateHomePageUIForSelectedLanguage() {
        let selectedLanguage = LanguageManager.getSelectedLanguage()
        if selectedLanguage == .english {
            routineAlertTitle = routineAlertTitleEnglish
            cancelIptal = CancelEnglish
            yesEvet = yesEnglish
            settingsDescription = descriptionEnglish
            reminderLabel = reninderLabelTextEnglish
            showDeleteAlertTitle = showDeleteAlertTitleEnglish
            showDeleteAlertMessage = showDeleteAlertMessageEnglish
            areYouSureTitle = areYouSureEnglish
            prayerCellName = parayerEnglish
            readingCellName = readingEnglish
            zikirCellName = zikirEnglish
            routineCellImageNamed = routineCellImageNamedEnglish
            languageName = english
            selectLanguage = selectLanguageEnglish
            selectLanguageDescription = selectLanguageDescriptionEnglish
            popoverAddDeleteLabel = popoverAddDeleteLabelEnglish
            popoverAddDeleteDescription = popoverAddDeleteDescriptionEnglish
            popoverUpdateLabel = popoverUpdateLabelEnglish
            popoverUpdateDescription = popoverUpdateDescriptionEnglish
            routineTips = routineTipsEnglish
            libraryTips = libraryTipsEnglish
            zikirTips = zikirTipsEnglish
            popoverAddDeleteLabelBookStore = popoverAddDeleteLabelBookStoreEnglish
            popoverAddDeleteDescriptionBookStore = popoverAddDeleteDescriptionBookStoreEnglish
            popoverUpdateLabelBookStore = popoverUpdateLabelBookStoreEnglish
            popoverUpdateDescriptionBookStore = popoverUpdateDescriptionBookStoreEnglish
            zikirPopoverAddLabel = zikirPopoverAddLabelEnglish
            zikirPopoverAddDescription = zikirPopoverAddDescriptionEnglish
            zikirPopoverDeleteLabel = zikirPopoverDeleteLabelEnglish
            zikirPopoverDeleteDescription = zikirPopoverDeleteDescriptionEnglish
            zikirResetRoutine = zikirResetRoutineEnglish
            zikirResetDescriptionRoutine = zikirResetDescriptionRoutineEnglish
            routineButtonName = routineButtonNameEnglish
            popoverYourGoal = popoverYourGoalEnglish
            popoverroutineName = popoverroutineNameEnglish
            alertMessageError = alertMessageErrorEnglish
            alertMessageRoutineNameError = alertMessageRoutineNameErrorEnglish
            deleteZikirRoutine = deleteZikirRoutineEnglish
            deleteZikirMessageRoutine = deleteZikirMessageRoutineEnglish
            cancelTitleRoutine = cancelTitleRoutineEnglish
            yesEvetRoutine = yesEvetRoutineEnglish
            toolTipRoutine = toolTipRoutineEnglish
            IamSorryMessageRoutine = IamSorryMessageRoutineEnglish
            okRoutine = okRoutineEnglish
            alertUpdateRoutine = alertUpdateRoutineEnglish
            alertUpdateRoutineMessage = alertUpdateRoutineMessageEnglish
            dailyGoalPHolder = dailyGoalPHolderEnglish
            updateTitle = updateTitleEnglish
            updatemessageRoutine = updatemessageRoutineEnglish
            errorMesaageNotFound = errorMesaageNotFoundEnglish
            errorMessageNotRead = uerrorMessageNotReadEnglish
            saveKaydet = saveKaydetEnglish
            pickerSelect = pickerSelectEnglish
            pickerZikir = pickerZikirEnglish
            pickerPrayer = pickerPrayerEnglish
            pickerReading = pickerReadingEnglish
            settingsToolTips = settingsToolTipsEnglish
            settingsLanguage = settingsLanguageEnglish
            
        } else if selectedLanguage == .turkish {
            routineAlertTitle = routineAlertTitleTurkish
            cancelIptal = CancelTurkish
            yesEvet = YesTurkish
            settingsDescription = descriptionTurkish
            reminderLabel = reninderLabelTextTurkish
            showDeleteAlertTitle = showDeleteAlertTitleTurkish
            showDeleteAlertMessage = showDeleteAlertMessageTurkish
            areYouSureTitle = areYouSureTurkish
            prayerCellName = prayerTurkish
            readingCellName = readingTurkish
            zikirCellName = zikirTurkish
            routineCellImageNamed = routineCellImageNamedTurkish
            languageName = turkish
            selectLanguage = selectLanguageTurkish
            selectLanguageDescription = rselectLanguageDescriptionTurkish
            popoverAddDeleteLabel = popoverAddDeleteLabelTurkish
            popoverAddDeleteDescription = popoverAddDeleteDescriptionTurkish
            popoverUpdateLabel = popoverUpdateLabelTurkish
            popoverUpdateDescription = popoverUpdateDescriptionTurkish
            routineTips = routineTipsTurkish
            libraryTips = libraryTipsTurkish
            zikirTips = zikirTipsTurkish
            popoverAddDeleteLabelBookStore = popoverAddDeleteLabelBookStoreTurkish
            popoverAddDeleteDescriptionBookStore = popoverAddDeleteDescriptionBookStoreTurkish
            popoverUpdateLabelBookStore = popoverUpdateLabelBookStoreTurkish
            popoverUpdateDescriptionBookStore = popoverUpdateDescriptionBookStoreTurkish
            zikirPopoverAddLabel = zikirPopoverAddLabelTurkish
            zikirPopoverAddDescription = zikirPopoverAddDescriptionTurkish
            zikirPopoverDeleteLabel = zikirPopoverDeleteLabelTurkish
            zikirPopoverDeleteDescription = zikirPopoverDeleteDescriptionTurkish
            zikirResetRoutine = zikirResetRoutineTurkish
            zikirResetDescriptionRoutine = zikirResetDescriptionRoutineTurkish
            routineButtonName = routineButtonNameTurkish
            popoverYourGoal = popoverYourGoalTurkish
            popoverroutineName = popoverroutineNameTurkish
            alertMessageError = alertMessageErrorTurkish
            deleteZikirRoutine = deleteZikirRoutineTurkish
            deleteZikirMessageRoutine = deleteZikirMessageRoutineTurkish
            cancelTitleRoutine = cancelTitleRoutineTurkish
            yesEvetRoutine = yesEvetRoutineTurkish
            toolTipRoutine = toolTipRoutineTurkish
            IamSorryMessageRoutine = IamSorryMessageRoutineTurkish
            okRoutine = okRoutineTurkish
            alertMessageRoutineNameError = alertMessageRoutineNameErrorTurkish
            alertUpdateRoutine = alertUpdateRoutineTurkish
            alertUpdateRoutineMessage = alertUpdateRoutineMessageTurkish
            dailyGoalPHolder = dailyGoalPHolderTurkish
            updateTitle = updateTitleTurkish
            updatemessageRoutine = updatemessageRoutineTurkish
            errorMesaageNotFound = errorMesaageNotFoundTurkish
            errorMessageNotRead = errorMessageNotReadTurkish
            saveKaydet = saveKaydetTurkish
            pickerSelect = pickerSelectTurkish
            pickerZikir = pickerZikirTurkish
            pickerPrayer = pickerPrayerTurkish
            pickerReading = pickerReadingTurkish
            settingsToolTips = settingsToolTipsTurkish
            settingsLanguage = settingsLanguageTurkish
        }
        
     
    }




// ZIKIR



var todayTotalTitle = ""
let todayTotalTitleEnglish = "Today / Total"
let todayTotalTitleTurkish = "Bugün / Toplam"

var segmentFirstTitle = ""
let segmentFirstTitleEnglish = "Counter"
let segmentFirstTitleTurkish = "Sayaç"

var segmentSecondTitle = ""
let segmentSecondTitleEnglish = "Asma"
let segmentSecondTitleTurkish = "Esma"

var cancelReadBookPopover = ""
let cancelReadBookPopoverEnglish  = "Cancel"
let cancelReadBookPopoverTurkish  = "İptal"

var CautionReadBookPopover = ""
let CautionReadBookPopoverEnglish  = "Caution"
let CautionReadBookPopoverTurkish  = "Dikkat"

var addNewZikirLabel = ""
let addNewZikirLabelEnglish  = "Add New Zikir"
let addNewZikirLabelTurkish  = "Yeni Zikir Ekle"

var addNewZikirDescription = ""
let addNewZikirDescriptionEnglish  = "Please enter the Name and Daily Goal of zikir in the designated field."
let addNewZikirDescriptionTurkish  = "Lütfen zikirin Adı ve Günlük Hedefini ilgili alana girin."

var DailyGoalpHolder = ""
let DailyGoalpHolderEnglish  = "Daily Goal (Optional)"
let DailyGoalpHolderTurkish  = "Gunluk Hedefin (Opsiyonel)"

var addZikirLabel = ""
let addZikirLabelEnglish  = "Add Zikir"
let addZikirLabelTurkish  = "Zikir Ekle"

var zikirNamePHolder = ""
let zikirNamePHolderEnglish  = "Zikir Name"
let zikirNamePHolderTurkish  = "Zikir Adi"

var enterANewNAme = ""
let enterANewNAmeEnglish  = "The zikir name is already taken. Please enter a new name."
let enterANewNAmeTurkish  = "Zikir adı zaten alınmış. Lütfen yeni bir ad girin."

var deleteZikirLabel = ""
let deleteZikirLabelEnglish  = "Delete Zikir"
let deleteZikirLabelTurkish  = "Zikiri Sil"

var deleteZikirDescription = ""
let deleteZikirDescriptionEnglish  = "Do you want to delete this zikir permanently?"
let deleteZikirDescriptionTurkish  = "Bu zikiri kalıcı olarak silmek istiyor musunuz?"

var willDeletingZikirDescription = ""
let willDeletingZikirDescriptionEnglish  = "An error occurred while deleting the zikir."
let willDeletingZikirDescriptionTurkish  = "Zikir silinirken bir hata oluştu."

var canNotDeleted = ""
let canNotDeletedEnglish  = "This tab cannot be deleted"
let canNotDeletedTurkish  = "Bu sekme silinemez"

var toolTipMessageDescription = ""
let toolTipMessageDescriptionEnglish  = "To add a new dhikr, click on the + button you see on the screen."
let toolTipMessageDescriptionTurkish  = "Yeni bir zikir eklemek için ekranda gördüğünüz + butonuna tıklayın."

var addZikirAmountLabel = ""
let addZikirAmountLabelEnglish  = "Add Zikir Amount"
let addZikirAmountLabelTurkish  = "Zikir Miktarını Ekle"

var addZikirAmountDescription = ""
let addZikirAmountDescriptionEnglish  = "Please enter the amount of zikir you want to add."
let addZikirAmountDescriptionTurkish  = "Lütfen eklemek istediğiniz zikir miktarını girin."

var amountOfZikirPHolder = ""
let amountOfZikirPHolderEnglish  = "Amount of Zikir"
let amountOfZikirPHolderTurkish  = "Zikir Miktarı"

var addAmount = ""
let addEnglish  = "Add"
let addTurkish  = "Ekle"

var errorDescriptionZikir = ""
let errorDescriptionZikirEnglish  = "You can enter a number of up to 8 digits."
let errorDescriptionZikirTurkish  = "En fazla 8 basamaklı bir sayı girebilirsiniz."

var resetCounterLabel = ""
let resetCounterLabelEnglish  = "Reset Counter"
let resetCounterLabelTurkish  = "Sayacı Sıfırla"

var resetCounterDescription = ""
let resetCounterDescriptionEnglish  = "To reset the counter, click on the reset button."
let resetCounterDescriptionTurkish  = "Sayacı sıfırlamak için 'Reset' butonuna tıklayın."

var dataNotFount = ""
let dataNotFountEnglish  = "Data could not be saved."
let dataNotFountTurkish  = "Veri kaydedilemedi."

var recomendedAmound = ""
let recomendedAmoundEnglish  = "The recommended amount of zikir :"
let recomendedAmoundTurkish  = "Tavsiye edilen zikir miktari :"

var resetToolTip = ""
let resetToolTipEnglish  = "To reset the counter, simply press and hold the button for two seconds."
let resetToolTipTurkish  = "Sayacı sıfırlamak için butona basılı tutun ve iki saniye bekleyin."

var zikirCancel = ""
let zikirCancelEnglish  = "Cancel"
let zikirCancelTurkish  = "İptal"

var updatemessageZikir = ""
let updatemessageZikirEnglish  = "Please make sure all fields are completed"
let updatemessageZikirTurkish  = "Lütfen tüm alanların doldurulduğundan emin olun."

var CautionDescriptionReadBookPopover = ""
let CautionDescriptionReadBookPopoverEnglish  = "When you click the Reset button, all your saved data will be permanently deleted and cannot be recovered."
let CautionDescriptionReadBookPopoverTurkish  = "Reset düğmesine tıkladığınızda, tüm kayıtlı verileriniz kalıcı olarak silinecek ve geri alınamayacak."


var alertTitleErrorZikir = ""
let alertTitleErrorZikirEnglish  = "Error"
let alertTitleErrorZikirTurkish  = "Hata"

var okZikir = ""
let okZikirEnglish = "Ok"
let okZikirTurkish = "Tamam"

func updateZikirUIForSelectedLanguage() {
        let selectedLanguage = LanguageManager.getSelectedLanguage()
        if selectedLanguage == .english {
            todayTotalTitle = todayTotalTitleEnglish
            segmentSecondTitle = segmentSecondTitleEnglish
            segmentFirstTitle = segmentFirstTitleEnglish
            zikirPopoverAddLabel = zikirPopoverAddLabelEnglish
            zikirPopoverAddDescription = zikirPopoverAddDescriptionEnglish
            zikirPopoverDeleteLabel = zikirPopoverDeleteLabelEnglish
            zikirPopoverDeleteDescription = zikirPopoverDeleteDescriptionEnglish
            zikirResetRoutine = zikirResetRoutineEnglish
            zikirResetDescriptionRoutine = zikirResetDescriptionRoutineEnglish
            cancelReadBookPopover = cancelReadBookPopoverEnglish
            CautionReadBookPopover = CautionReadBookPopoverEnglish
            addNewZikirLabel = addNewZikirLabelEnglish
            addNewZikirDescription = addNewZikirDescriptionEnglish
            DailyGoalpHolder = DailyGoalpHolderEnglish
            addZikirLabel = addZikirLabelEnglish
            zikirNamePHolder = zikirNamePHolderEnglish
            enterANewNAme = enterANewNAmeEnglish
            deleteZikirLabel = deleteZikirLabelEnglish
            deleteZikirDescription = deleteZikirDescriptionEnglish
            willDeletingZikirDescription = willDeletingZikirDescriptionEnglish
            canNotDeleted = canNotDeletedEnglish
            toolTipMessageDescription = toolTipMessageDescriptionEnglish
            addZikirAmountLabel = addZikirAmountLabelEnglish
            addZikirAmountDescription = addZikirAmountDescriptionEnglish
            amountOfZikirPHolder = amountOfZikirPHolderEnglish
            addAmount = addEnglish
            errorDescriptionZikir = errorDescriptionZikirEnglish
            resetCounterLabel = resetCounterLabelEnglish
            resetCounterDescription = resetCounterDescriptionEnglish
            dataNotFount = dataNotFountEnglish
            recomendedAmound = recomendedAmoundEnglish
            resetToolTip = resetToolTipEnglish
            zikirCancel = zikirCancelEnglish
            updatemessageZikir = updatemessageZikirEnglish
            alertTitleErrorZikir = alertTitleErrorZikirEnglish
            okZikir = okZikirEnglish
            CautionDescriptionReadBookPopover = CautionDescriptionReadBookPopoverEnglish
            
            
            
        } else if selectedLanguage == .turkish {
            todayTotalTitle = todayTotalTitleTurkish
            segmentSecondTitle = segmentSecondTitleTurkish
            segmentFirstTitle = segmentFirstTitleTurkish
            zikirPopoverAddLabel = zikirPopoverAddLabelTurkish
            zikirPopoverAddDescription = zikirPopoverAddDescriptionTurkish
            zikirPopoverDeleteLabel = zikirPopoverDeleteLabelTurkish
            zikirPopoverDeleteDescription = zikirPopoverDeleteDescriptionTurkish
            zikirResetRoutine = zikirResetRoutineTurkish
            zikirResetDescriptionRoutine = zikirResetDescriptionRoutineTurkish
            cancelReadBookPopover = cancelReadBookPopoverTurkish
            CautionReadBookPopover = CautionReadBookPopoverTurkish
            addNewZikirLabel = addNewZikirLabelTurkish
            addNewZikirDescription = addNewZikirDescriptionTurkish
            DailyGoalpHolder = DailyGoalpHolderTurkish
            addZikirLabel = addZikirLabelTurkish
            zikirNamePHolder = zikirNamePHolderTurkish
            enterANewNAme = enterANewNAmeTurkish
            deleteZikirLabel = deleteZikirLabelTurkish
            deleteZikirDescription = deleteZikirDescriptionTurkish
            willDeletingZikirDescription =  willDeletingZikirDescriptionTurkish
            canNotDeleted = canNotDeletedTurkish
            toolTipMessageDescription = toolTipMessageDescriptionTurkish
            addZikirAmountLabel = addZikirAmountLabelTurkish
            addZikirAmountDescription = addZikirAmountDescriptionTurkish
            amountOfZikirPHolder = amountOfZikirPHolderTurkish
            addAmount = addTurkish
            errorDescriptionZikir = errorDescriptionZikirTurkish
            resetCounterLabel = resetCounterLabelTurkish
            resetCounterDescription = resetCounterDescriptionTurkish
            dataNotFount = dataNotFountTurkish
            recomendedAmound = recomendedAmoundTurkish
            resetToolTip = resetToolTipTurkish
            zikirCancel = zikirCancelTurkish
            updatemessageZikir = updatemessageZikirTurkish
            alertTitleErrorZikir = alertTitleErrorZikirTurkish
            okZikir = okZikirTurkish
            CautionDescriptionReadBookPopover = CautionDescriptionReadBookPopoverTurkish
        }
    
     
}




















// LIBRARY
var currentTotalTitle = ""
let currentTotalTitleEnglish = "Currently / Total"
let currentTotalTitleTurkish = "Ayrac / Toplam"

var DeleteBook = ""
let DeleteBookEnglish  = "Delete Book"
let DeleteBookTurkish  = "Kitabı Sil"

var DeleteBookDescription = ""
let DeleteBookDescriptionEnglish  = "Do you want to delete this book permanently?"
let DeleteBookDescriptionTurkish  = "Bu kitabı kalıcı olarak silmek istiyor musunuz?"

var cancelBookStore = ""
let cancelBookStoreEnglish  = "Cancel"
let cancelBookStoreTurkish  = "İptal"

var AlertBookDescription = ""
let AlertBookDescriptionEnglish  = "This book cannot be deleted as it is among the built-in books of the application."
let AlertBookDescriptionTurkish  = "Bu kitap, uygulamanın yerleşik kitapları arasında olduğu için silinemez."

var yesEvetBookStore = ""
let yesEvetBookStoreEnglish = "Yes"
let yesEvetBookStoreTurkish = "Evet"

var PageSelectionReadBook = ""
let PageSelectionReadBookEnglish = "Page Selection"
let PageSelectionReadBookTurkish = "Sayfa Seçim"

var PageSelectionMessageReadBook = ""
let PageSelectionMessageReadBookEnglish = "Please enter the number of the page you want to go to."
let PageSelectionMessageReadBookTurkish = "Lütfen gitmek istediğiniz sayfanın numarasını girin."


var PageNumberPHolderReadBook = ""
let PageNumberPHolderReadBookEnglish = "Page Number"
let PageNumberPHolderReadBookTurkish = "Sayfa Numarası"

var goReadBook = ""
let goReadBookEnglish = "Go"
let goReadBookTurkish = "Git"

var AddExplanationdescriptionPopoverReadBook = ""
let AddExplanationdescriptionPopoverReadBookEnglish = "Please add your explanation"
let AddExplanationdescriptionPopoverReadBookTurkish = "Lütfen açıklamanızı ekleyin."

var AddExplanationPopoverReadBook = ""
let AddExplanationPopoverReadBookEnglish = "Add Explanation"
let AddExplanationPopoverReadBookTurkish = "Açıklama Ekle"

var enterReadBook = ""
let enterReadBookEnglish = "Enter"
let enterReadBookTurkish = "Tamam"

var errorMessageBookmarkReadBook = ""
let errorMessageBookmarkReadBookEnglish = "The page already contains a bookmark."
let errorMessageBookmarkReadBookTurkish = "Bu sayfa zaten bir yer imi içeriyor."

var ExplanationPHolderReadBook = ""
let ExplanationPHolderReadBookEnglish = "Explanation"
let ExplanationPHolderReadBookTurkish = "Açıklama"

var SuccessReadBook = ""
let SuccessReadBookEnglish = "Success"
let SuccessReadBookTurkish = "Başarılı"

var addSuccessfulyBookmarkReadBook = ""
let addSuccessfulyBookmarkReadBookEnglish = "Bookmark added successfully."
let addSuccessfulyBookmarkReadBookTurkish = "Yer işareti başarıyla eklendi."

var errorRegisteredReadBook = ""
let errorRegisteredReadBookEnglish = "This book is already registered in your application."
let errorRegisteredReadBookTurkish = "Bu kitap zaten uygulamanızda kayıtlı."

var SuccessfulySavgedReadBook = ""
let SuccessfulySavgedReadBookEnglish = "Successfully saved."
let SuccessfulySavgedReadBookTurkish = "Başarıyla Kaydedildi"

var alertTitleErrorLibrary = ""
let alertTitleErrorLibraryEnglish  = "Error"
let alertTitleErrorLibraryTurkish  = "Hata"

var pageSelection = ""
let pageSelectionEnglish  = "Go To Page"
let pageSelectionTurkish  = "Sayfaya Git"

var addBookmark = ""
let addBookmarkEnglish  = "Add Bookmark"
let addBookmarkTurkish  = "Ayraç Ekle"

var tabBarHome = ""
let tabBarHomeEnglish = "Home"
let tabBarHomeTurkish = "Ana Sayfa"

var tabBarRoutine = ""
let tabBarRoutineEnglish  = "Daily Routine"
let tabBarRoutineTurkish  = "Günlük Rutinler"

var tabBarDhikr = ""
let tabBarDhikrEnglish  = "Dhikr"
let tabBarDhikrTurkish  = "Zikir"

var tabBarLibrary = ""
let tabBarLibraryEnglish  = "Library"
let tabBarLibraryTurkish  = "Kütüphane"


func updateLibraryUIForSelectedLanguage() {
        let selectedLanguage = LanguageManager.getSelectedLanguage()
        if selectedLanguage == .english {
            currentTotalTitle = currentTotalTitleEnglish
            DeleteBook = DeleteBookEnglish
            DeleteBookDescription = DeleteBookDescriptionEnglish
            cancelBookStore = cancelBookStoreEnglish
            AlertBookDescription = AlertBookDescriptionEnglish
            yesEvetBookStore = yesEvetBookStoreEnglish
            PageSelectionReadBook = PageSelectionReadBookEnglish
            PageSelectionMessageReadBook = PageSelectionMessageReadBookEnglish
            PageNumberPHolderReadBook = PageNumberPHolderReadBookEnglish
            goReadBook = goReadBookEnglish
            AddExplanationdescriptionPopoverReadBook = AddExplanationdescriptionPopoverReadBookEnglish
            AddExplanationPopoverReadBook = AddExplanationPopoverReadBookEnglish
            enterReadBook = enterReadBookEnglish
            errorMessageBookmarkReadBook = errorMessageBookmarkReadBookEnglish
            ExplanationPHolderReadBook = ExplanationPHolderReadBookEnglish
            SuccessReadBook = SuccessReadBookEnglish
            addSuccessfulyBookmarkReadBook = addSuccessfulyBookmarkReadBookEnglish
            errorRegisteredReadBook = errorRegisteredReadBookEnglish
            SuccessfulySavgedReadBook = SuccessfulySavgedReadBookEnglish
            alertTitleErrorLibrary = alertTitleErrorLibraryEnglish
            pageSelection = pageSelectionEnglish
            addBookmark = addBookmarkEnglish
           surahFatiha = surahFatihaEnglish
            tabBarHome = tabBarHomeEnglish
            tabBarRoutine = tabBarRoutineEnglish
            tabBarDhikr = tabBarDhikrEnglish
            tabBarLibrary = tabBarLibraryEnglish
           surah1 = surah1English
           surah2 = surah2English
           surah3 = surah3English
           surah4 = surah4English
           surah5 = surah5English
           surah6 = surah6English
           surah7 = surah7English
           surah8 = surah8English
           surah9 = surah9English
           surah10 = surah10English
           surah11 = surah11English
           surah12 = surah12English
           surah13 = surah13English
           surah14 = surah14English
           surah15 = surah15English
           surah16 = surah16English
           surah17 = surah17English
           surah18 = surah18English
           surah19 = surah19English
           surah20 = surah20English
           surah21 = surah21English
           surah22 = surah22English
           surah23 = surah23English
           surah24 = surah24English
           surah25 = surah25English
           surah26 = surah26English
           surah27 = surah27English
           surah28 = surah28English
           surah29 = surah29English
           surah30 = surah30English
           surah31 = surah31English
           surah32 = surah32English
           surah33 = surah33English
           surah34 = surah34English
           surah35 = surah35English
           surah36 = surah36English
           surah37 = surah37English
           surah38 = surah38English
           surah39 = surah39English
           surah40 = surah40English
           surah41 = surah41English
           surah42 = surah42English
           surah43 = surah43English
           surah44 = surah44English
           surah45 = surah45English
           surah46 = surah46English
           surah47 = surah47English
           surah48 = surah48English
           surah49 = surah49English
           surah50 = surah50English
           surah51 = surah51English
           surah52 = surah52English
           surah53 = surah53English
           surah54 = surah54English
           surah55 = surah55English
           surah56 = surah56English
           surah57 = surah57English
           surah58 = surah58English
           surah59 = surah59English
           surah60 = surah60English
           surah61 = surah61English
           surah62 = surah62English
           surah63 = surah63English
           surah64 = surah64English
           surah65 = surah65English
           surah66 = surah66English
           surah67 = surah67English
           surah68 = surah68English
           surah69 = surah69English
           surah70 = surah70English
           surah71 = surah71English
           surah72 = surah72English
           surah73 = surah73English
           surah74 = surah74English
           surah75 = surah75English
           surah76 = surah76English
           surah77 = surah77English
           surah78 = surah78English
           surah79 = surah79English
           surah80 = surah80English
           surah81 = surah81English
           surah82 = surah82English
           surah83 = surah83English
           surah84 = surah84English
           surah85 = surah85English
           surah86 = surah86English
           surah87 = surah87English
           surah88 = surah88English
           surah89 = surah89English
           surah90 = surah90English
           surah91 = surah91English
           surah92 = surah92English
           surah93 = surah93English
           surah94 = surah94English
           surah95 = surah95English
           surah96 = surah96English
           surah97 = surah97English
           surah98 = surah98English
           surah99 = surah99English
           surah100 = surah100English
           surah101 = surah101English
           surah102 = surah102English
           surah103 = surah103English
           surah104 = surah104English
           surah105 = surah105English
           surah106 = surah106English
           surah107 = surah107English
           surah108 = surah108English
           surah109 = surah109English
           surah110 = surah110English
           surah111 = surah111English
           surah112 = surah112English
           surah113 = surah113English
            chapter1 = Chapter1English
            chapter2 = Chapter2English
            chapter3 = Chapter3English
            chapter4 = Chapter4English
            chapter5 = Chapter5English
            chapter6 = Chapter6English
            chapter7 = Chapter7English
            chapter8 = Chapter8English
            chapter9 = Chapter9English
            chapter10 = Chapter10English
            chapter11 = Chapter11English
            chapter12 = Chapter12English
            chapter13 = Chapter13English
            chapter14 = Chapter14English
            chapter15 = Chapter15English
            chapter16 = Chapter16English
            chapter17 = Chapter17English
            chapter18 = Chapter18English
            chapter19 = Chapter19English
            chapter20 = Chapter20English
            chapter21 = Chapter21English
            chapter22 = Chapter22English
            chapter23 = Chapter23English
            chapter24 = Chapter24English
            chapter25 = Chapter25English
            chapter26 = Chapter26English
            chapter27 = Chapter27English
            chapter28 = Chapter28English
            chapter29 = Chapter29English
            chapter30 = Chapter30English
            searchPlaceHolder = searchPlaceHolderEnglish
            goToPageButtonTitle = goToPageButtonTitleEnglish
            
            
            
            
            
            
            

        } else if selectedLanguage == .turkish {
            currentTotalTitle = currentTotalTitleTurkish
            DeleteBook = DeleteBookTurkish
            DeleteBookDescription = DeleteBookDescriptionTurkish
            cancelBookStore = cancelBookStoreTurkish
            AlertBookDescription = AlertBookDescriptionTurkish
            yesEvetBookStore = yesEvetBookStoreTurkish
            PageSelectionReadBook = PageSelectionReadBookTurkish
            PageSelectionMessageReadBook = PageSelectionMessageReadBookTurkish
            PageNumberPHolderReadBook = PageNumberPHolderReadBookTurkish
            goReadBook = goReadBookTurkish
            AddExplanationdescriptionPopoverReadBook = AddExplanationdescriptionPopoverReadBookTurkish
            AddExplanationPopoverReadBook = AddExplanationPopoverReadBookTurkish
            enterReadBook = enterReadBookTurkish
            errorMessageBookmarkReadBook = errorMessageBookmarkReadBookTurkish
            ExplanationPHolderReadBook = ExplanationPHolderReadBookTurkish
            SuccessReadBook = SuccessReadBookTurkish
            addSuccessfulyBookmarkReadBook = addSuccessfulyBookmarkReadBookTurkish
            errorRegisteredReadBook = errorRegisteredReadBookTurkish
            SuccessfulySavgedReadBook = SuccessfulySavgedReadBookTurkish
            alertTitleErrorLibrary = alertTitleErrorLibraryTurkish
            pageSelection = pageSelectionTurkish
            addBookmark = addBookmarkTurkish
            surahFatiha = surahFatihaTurkish
            tabBarHome = tabBarHomeTurkish
            tabBarRoutine = tabBarRoutineTurkish
            tabBarDhikr = tabBarDhikrTurkish
            tabBarLibrary = tabBarLibraryTurkish
            surah1 =  surah1Turkish
            surah2 = surah2Turkish
            surah3 = surah3Turkish
            surah4 = surah4Turkish
            surah5 = surah5Turkish
            surah6 = surah6Turkish
            surah7 = surah7Turkish
            surah8 = surah8Turkish
            surah9 = surah9Turkish
            surah10 = surah10Turkish
            surah11 = surah11Turkish
            surah12 = surah12Turkish
            surah13 = surah13Turkish
            surah14 = surah14Turkish
            surah15 = surah15Turkish
            surah16 = surah16Turkish
            surah17 = surah17Turkish
            surah18 = surah18Turkish
            surah19 = surah19Turkish
            surah20 = surah20Turkish
            surah21 = surah21Turkish
            surah22 = surah22Turkish
            surah23 = surah23Turkish
            surah24 = surah24Turkish
            surah25 = surah25Turkish
            surah26 = surah26Turkish
            surah27 = surah27Turkish
            surah28 = surah28Turkish
            surah29 = surah29Turkish
            surah30 = surah30Turkish
            surah31 = surah31Turkish
            surah32 = surah32Turkish
            surah33 = surah33Turkish
            surah34 = surah34Turkish
            surah35 = surah35Turkish
            surah36 = surah36Turkish
            surah37 = surah37Turkish
            surah38 = surah38Turkish
            surah39 = surah39Turkish
            surah40 = surah40Turkish
            surah41 = surah41Turkish
            surah42 = surah42Turkish
            surah43 = surah43Turkish
            surah44 = surah44Turkish
            surah45 = surah45Turkish
            surah46 = surah46Turkish
            surah47 = surah47Turkish
            surah48 = surah48Turkish
            surah49 = surah49Turkish
            surah50 = surah50Turkish
            surah51 = surah51Turkish
            surah52 = surah52Turkish
            surah53 = surah53Turkish
            surah54 = surah54Turkish
            surah55 = surah55Turkish
            surah56 = surah56Turkish
            surah57 = surah57Turkish
            surah58 = surah58Turkish
            surah59 = surah59Turkish
            surah60 = surah60Turkish
            surah61 = surah61Turkish
            surah62 = surah62Turkish
            surah63 = surah63Turkish
            surah64 = surah64Turkish
            surah65 = surah65Turkish
            surah66 = surah66Turkish
            surah67 = surah67Turkish
            surah68 = surah68Turkish
            surah69 = surah69Turkish
            surah70 = surah70Turkish
            surah71 = surah71Turkish
            surah72 = surah72Turkish
            surah73 = surah73Turkish
            surah74 = surah74Turkish
            surah75 = surah75Turkish
            surah76 = surah76Turkish
            surah77 = surah77Turkish
            surah78 = surah78Turkish
            surah79 = surah79Turkish
            surah80 = surah80Turkish
            surah81 = surah81Turkish
            surah82 = surah82Turkish
            surah83 = surah83Turkish
            surah84 = surah84Turkish
            surah85 = surah85Turkish
            surah86 = surah86Turkish
            surah87 = surah87Turkish
            surah88 = surah88Turkish
            surah89 = surah89Turkish
            surah90 = surah90Turkish
            surah91 = surah91Turkish
            surah92 = surah92Turkish
            surah93 = surah93Turkish
            surah94 = surah94Turkish
            surah95 = surah95Turkish
            surah96 = surah96Turkish
            surah97 = surah97Turkish
            surah98 = surah98Turkish
            surah99 = surah99Turkish
            surah100 = surah100Turkish
            surah101 = surah101Turkish
            surah102 = surah102Turkish
            surah103 = surah103Turkish
            surah104 = surah104Turkish
            surah105 = surah105Turkish
            surah106 = surah106Turkish
            surah107 = surah107Turkish
            surah108 = surah108Turkish
            surah109 = surah109Turkish
            surah110 = surah110Turkish
            surah111 = surah111Turkish
            surah112 = surah112Turkish
            surah113 = surah113Turkish
            chapter1 = chapter1Turkish
            chapter2 = chapter2Turkish
            chapter3 = chapter3Turkish
            chapter4 = chapter4Turkish
            chapter5 = chapter5Turkish
            chapter6 = chapter6Turkish
            chapter7 = chapter7Turkish
            chapter8 = chapter8Turkish
            chapter9 = chapter9Turkish
            chapter10 = chapter10Turkish
            chapter11 = chapter11Turkish
            chapter12 = chapter12Turkish
            chapter13 = chapter13Turkish
            chapter14 = chapter14Turkish
            chapter15 = chapter15Turkish
            chapter16 = chapter16Turkish
            chapter17 = chapter17Turkish
            chapter18 = chapter18Turkish
            chapter19 = chapter19Turkish
            chapter20 = chapter20Turkish
            chapter21 = chapter21Turkish
            chapter22 = chapter22Turkish
            chapter23 = chapter23Turkish
            chapter24 = chapter24Turkish
            chapter25 = chapter25Turkish
            chapter26 = chapter26Turkish
            chapter27 = chapter27Turkish
            chapter28 = chapter28Turkish
            chapter29 = chapter29Turkish
            chapter30 = chapter30Turkish
            searchPlaceHolder = searchPlaceHolderTurkish
            goToPageButtonTitle = goToPageButtonTitleTurkish

        }
    
     
    }




var surahFatiha = ""
var surah1 = ""
var surah2 = ""
var surah3 = ""
var surah4 = ""
var surah5 = ""
var surah6 = ""
var surah7 = ""
var surah8 = ""
var surah9 = ""
var surah10 = ""
var surah11 = ""
var surah12 = ""
var surah13 = ""
var surah14 = ""
var surah15 = ""
var surah16 = ""
var surah17 = ""
var surah18 = ""
var surah19 = ""
var surah20 = ""
var surah21 = ""
var surah22 = ""
var surah23 = ""
var surah24 = ""
var surah25 = ""
var surah26 = ""
var surah27 = ""
var surah28 = ""
var surah29 = ""
var surah30 = ""
var surah31 = ""
var surah32 = ""
var surah33 = ""
var surah34 = ""
var surah35 = ""
var surah36 = ""
var surah37 = ""
var surah38 = ""
var surah39 = ""
var surah40 = ""
var surah41 = ""
var surah42 = ""
var surah43 = ""
var surah44 = ""
var surah45 = ""
var surah46 = ""
var surah47 = ""
var surah48 = ""
var surah49 = ""
var surah50 = ""
var surah51 = ""
var surah52 = ""
var surah53 = ""
var surah54 = ""
var surah55 = ""
var surah56 = ""
var surah57 = ""
var surah58 = ""
var surah59 = ""
var surah60 = ""
var surah61 = ""
var surah62 = ""
var surah63 = ""
var surah64 = ""
var surah65 = ""
var surah66 = ""
var surah67 = ""
var surah68 = ""
var surah69 = ""
var surah70 = ""
var surah71 = ""
var surah72 = ""
var surah73 = ""
var surah74 = ""
var surah75 = ""
var surah76 = ""
var surah77 = ""
var surah78 = ""
var surah79 = ""
var surah80 = ""
var surah81 = ""
var surah82 = ""
var surah83 = ""
var surah84 = ""
var surah85 = ""
var surah86 = ""
var surah87 = ""
var surah88 = ""
var surah89 = ""
var surah90 = ""
var surah91 = ""
var surah92 = ""
var surah93 = ""
var surah94 = ""
var surah95 = ""
var surah96 = ""
var surah97 = ""
var surah98 = ""
var surah99 = ""
var surah100 = ""
var surah101 = ""
var surah102 = ""
var surah103 = ""
var surah104 = ""
var surah105 = ""
var surah106 = ""
var surah107 = ""
var surah108 = ""
var surah109 = ""
var surah110 = ""
var surah111 = ""
var surah112 = ""
var surah113 = ""
var chapter1 = ""
var chapter2 = ""
var chapter3 = ""
var chapter4 = ""
var chapter5 = ""
var chapter6 = ""
var chapter7 = ""
var chapter8 = ""
var chapter9 = ""
var chapter10 = ""
var chapter11 = ""
var chapter12 = ""
var chapter13 = ""
var chapter14 = ""
var chapter15 = ""
var chapter16 = ""
var chapter17 = ""
var chapter18 = ""
var chapter19 = ""
var chapter20 = ""
var chapter21 = ""
var chapter22 = ""
var chapter23 = ""
var chapter24 = ""
var chapter25 = ""
var chapter26 = ""
var chapter27 = ""
var chapter28 = ""
var chapter29 = ""
var chapter30 = ""
var searchPlaceHolder = ""
var goToPageButtonTitle = ""








let surahFatihaEnglish = "Al-Fatiha (The Opening)"
let surah1English = "Al-Baqarah (The Cow)"
let surah2English = "Al-Imran (The Family of Imran)"
let surah3English = "An-Nisa (The Women)"
let surah4English = "Al-Maidah (The Table Spread)"
let surah5English = "Al-Anam (The Cattle)"
let surah6English = "Al-A'raf (The Heights)"
let surah7English = "Al-Anfal (The Spoils of War)"
let surah8English = "Al-Taubah (Repentance)"
let surah9English = "Yunus (Prophet Jonah)"
let surah10English = "Hud (Prophet Hud)"
let surah11English = "Yusuf (Prophet Joseph)"
let surah12English = "Ar-Rad (The Thunder)"
let surah13English = "Ibrahim (Prophet Abraham)"
let surah14English = "Al-Hijr (The Rocky Tract)"
let surah15English = "An-Nahl (The Bee)"
let surah16English = "Al-Isra (The Night Journey)"
let surah17English = "Al-Kahf (The Cave)"
let surah18English = "Maryam (Mary)"
let surah19English = "Ta-Ha"
let surah20English = "Al-Anbiya (The Prophets)"
let surah21English = "Al-Hajj (The Pilgrimage)"
let surah22English = "Al-Mu'minun (The Believers)"
let surah23English = "Al-Noor (The Light)"
let surah24English = "Al-Furqan (The Criterion)"
let surah25English = "Al-Shuara (The Poets)"
let surah26English = "Al-Naml (The Ants)"
let surah27English = "Al-Qasas (The Stories)"
let surah28English = "Al-Ankaboot (The Spider)"
let surah29English = "Al-Room (The Romans)"
let surah30English = "Luqman"
let surah31English = "As-Sajda (The Adoration)"
let surah32English = "Al-Ahzab (The Coalition)"
let surah33English = "Saba (Sheva)"
let surah34English = "Fatir (Originator)"
let surah35English = "Ya-Seen (Yaseen)"
let surah36English = "As-Saaffat (Those Who Set the Ranks)"
let surah37English = "Sad (The Arabic Letter Sad)"
let surah38English = "Az-Zumar (The Companies)"
let surah39English = "Al-Mu'min (The Believer)"
let surah40English = "Fussilat (Explained in Detail)"
let surah41English = "Ash-Shura (Council)"
let surah42English = "Az-Zukhruf (The Ornaments of Gold)"
let surah43English = "Ad-Dukhan (The Drought)"
let surah44English = "Al-Jasiyah (The Kneeling)"
let surah45English = "Al-Ahqaf (The Sandhills)"
let surah46English = "Muhammad"
let surah47English = "Al-Fath (The Victory)"
let surah48English = "Al-Hujuraat (The Apartments)"
let surah49English = "Qaf (The Letter Qaf)"
let surah50English = "Adh-Dhariyat (The Scatterers)"
let surah51English = "At-Tur (The Mountain)"
let surah52English = "An-Najm (The Star)"
let surah53English = "Al-Qamar (The Moon)"
let surah54English = "Ar-Rahman (The Most Gracious)"
let surah55English = "Al-Waqiah (The Event)"
let surah56English = "Al-Hadid (The Iron)"
let surah57English = "Al-Mujadilah (The Pleading Woman)"
let surah58English = "Al-Hashr (The Banishment)"
let surah59English = "Al-Mumtahanah (The Woman Who is Examined)"
let surah60English = "As-Saff (The Ranks)"
let surah61English = "Al-Jumuah (The Congregation - Friday)"
let surah62English = "Al-Munafiqoon (The Hypocrites)"
let surah63English = "At-Taghabun (The Manifestation of Losses)"
let surah64English = "At-Talaq (Divorce)"
let surah65English = "At-Tahrim (The Prohibition)"
let surah66English = "Al-Mulk (The Kingdom)"
let surah67English = "Al-Qalam (The Pen)"
let surah68English = "Al-Haqqah (The Sure Truth)"
let surah69English = "Al-Maarij (The Ways of Ascent)"
let surah70English = "Nuh (Prophet Noah)"
let surah71English = "Al-Jinn (The Jinn)"
let surah72English = "Al-Muzzammil (The One Covering Himself)"
let surah73English = "Al-Muddathir (The One Wrapping Himself Up)"
let surah74English = "Al-Qiyamah (The Resurrection)"
let surah75English = "Al-Insan (The Man)"
let surah76English = "Al-Mursalat (Those Sent Forth)"
let surah77English = "An-Naba (The News)"
let surah78English = "An-Nazi'at (Those Who Pull Out)"
let surah79English = "Abasa (He Frowned)"
let surah80English = "At-Takwir (The Overthrowing)"
let surah81English = "Al-Infitar (The Splitting Asunder)"
let surah82English = "Al-Mutaffifin (The Defrauding)"
let surah83English = "Al-Inshiqaq (The Splitting Asunder)"
let surah84English = "Al-Burooj (The Big Stars)"
let surah85English = "At-Tariq (The Night Comer)"
let surah86English = "Al-Ala (The Most High)"
let surah87English = "Al-Ghashiyah (The Overwhelming)"
let surah88English = "Al-Fajr (The Dawn)"
let surah89English = "Al-Balad (The City)"
let surah90English = "Ash-Shams (The Sun)"
let surah91English = "Al-Lail (The Night)"
let surah92English = "Ad-Duha (The Early Hours)"
let surah93English = "Al-Inshirah (The Opening Up)"
let surah94English = "At-Tin (The Fig)"
let surah95English = "Al-Alaq (The Clot)"
let surah96English = "Al-Qadr (The Majesty)"
let surah97English = "Al-Bayyinah (The Clear Evidence)"
let surah98English = "Az-Zilzal (The Shaking)"
let surah99English = "Al-Adiyat (The Assaulters)"
let surah100English = "Al-Qariah (The Calamity)"
let surah101English = "At-Takathur (The Rivalry in World Increase)"
let surah102English = "Al-Asr (The Time)"
let surah103English = "Al-Humazah (The Slanderer)"
let surah104English = "Al-Fil (The Elephant)"
let surah105English = "Quraish (Quraish)"
let surah106English = "Al-Ma'un (Act of Kindness)"
let surah107English = "Al-Kawthar (The Abundance of Good)"
let surah108English = "Al-Kafirun (The Disbelievers)"
let surah109English = "An-Nasr (The Help)"
let surah110English = "Al-Masad (The Flame)"
let surah111English = "Al-Ikhlas (The Unity)"
let surah112English = "Al-Falaq (The Dawn)"
let surah113English = "An-Nas (The Men)"
let Chapter1English = "Chapter 1"
let Chapter2English = "Chapter 2"
let Chapter3English = "Chapter 3"
let Chapter4English = "Chapter 4"
let Chapter5English = "Chapter 5"
let Chapter6English = "Chapter 6"
let Chapter7English = "Chapter 7"
let Chapter8English = "Chapter 8"
let Chapter9English = "Chapter 9"
let Chapter10English = "Chapter 10"
let Chapter11English = "Chapter 11"
let Chapter12English = "Chapter 12"
let Chapter13English = "Chapter 13"
let Chapter14English = "Chapter 14"
let Chapter15English = "Chapter 15"
let Chapter16English = "Chapter 16"
let Chapter17English = "Chapter 17"
let Chapter18English = "Chapter 18"
let Chapter19English = "Chapter 19"
let Chapter20English = "Chapter 20"
let Chapter21English = "Chapter 21"
let Chapter22English = "Chapter 22"
let Chapter23English = "Chapter 23"
let Chapter24English = "Chapter 24"
let Chapter25English = "Chapter 25"
let Chapter26English = "Chapter 26"
let Chapter27English = "Chapter 27"
let Chapter28English = "Chapter 28"
let Chapter29English = "Chapter 29"
let Chapter30English = "Chapter 30"
let searchPlaceHolderEnglish = "Write Surah or Chapter"
let goToPageButtonTitleEnglish = "Go to Page"




let surahFatihaTurkish = "Fâtiha Sûresi"
let surah1Turkish =    "Bakara Sûresi"
let surah2Turkish =    "Âl-i İmrân Sûresi"
let surah3Turkish =    "Nisâ Sûresi"
let surah4Turkish =    "Mâide Sûresi"
let surah5Turkish =    "En'âm Sûresi"
let surah6Turkish =    "A'râf Sûresi"
let surah7Turkish =    "Enfâl Sûresi"
let surah8Turkish =    "Tevbe Sûresi"
let surah9Turkish =    "Yunus Sûresi"
let surah10Turkish =    "Hûd Sûresi"
let surah11Turkish =    "Yusuf Sûresi"
let surah12Turkish =    "Ra'd Sûresi"
let surah13Turkish =    "İbrahim Sûresi"
let surah14Turkish =    "Hicr Sûresi"
let surah15Turkish =    "Nahl Sûresi"
let surah16Turkish =    "İsrâ Sûresi"
let surah17Turkish =    "Kehf Sûresi"
let surah18Turkish =    "Meryem Sûresi"
let surah19Turkish =    "Tâ-Hâ Sûresi"
let surah20Turkish =    "Enbiyâ Sûresi"
let surah21Turkish =    "Hac Sûresi"
let surah22Turkish =    "Mü'minûn Sûresi"
let surah23Turkish =    "Nûr Sûresi"
let surah24Turkish =    "Furkan Sûresi"
let surah25Turkish =    "Şuarâ Sûresi"
let surah26Turkish =    "Neml Sûresi"
let surah27Turkish =    "Kasas Sûresi"
let surah28Turkish =    "Ankebût Sûresi"
let surah29Turkish =    "Rûm Sûresi"
let surah30Turkish =    "Lokman Sûresi"
let surah31Turkish =    "Secde Sûresi"
let surah32Turkish =    "Ahzâb Sûresi"
let surah33Turkish =    "Sebe' Sûresi"
let surah34Turkish =    "Fâtır Sûresi"
let surah35Turkish =    "Yâsin Sûresi"
let surah36Turkish =    "Sâffât Sûresi"
let surah37Turkish =    "Sâd Sûresi"
let surah38Turkish =    "Zümer Sûresi"
let surah39Turkish =    "Mü'min Sûresi"
let surah40Turkish =    "Fussilet Sûresi"
let surah41Turkish =    "Şûrâ Sûresi"
let surah42Turkish =    "Zuhruf Sûresi"
let surah43Turkish =    "Duhân Sûresi"
let surah44Turkish =    "Câsiye Sûresi"
let surah45Turkish =    "Ahkaf Sûresi"
let surah46Turkish =    "Muhammed Sûresi"
let surah47Turkish =    "Fetih Sûresi"
let surah48Turkish =    "Hucurât Sûresi"
let surah49Turkish =    "Kaf Sûresi"
let surah50Turkish =    "Zâriyât Sûresi"
let surah51Turkish =    "Tûr Sûresi"
let surah52Turkish =    "Necm Sûresi"
let surah53Turkish =    "Kamer Sûresi"
let surah54Turkish =    "Rahmân Sûresi"
let surah55Turkish =    "Vâkıa Sûresi"
let surah56Turkish =    "Hadid Sûresi"
let surah57Turkish =    "Mücâdele Sûresi"
let surah58Turkish =    "Haşr Sûresi"
let surah59Turkish =    "Mümtehine Sûresi"
let surah60Turkish =    "Saf Sûresi"
let surah61Turkish =    "Cum'a Sûresi"
let surah62Turkish =    "Münâfikûn Sûresi"
let surah63Turkish =    "Teğabün Sûresi"
let surah64Turkish =    "Talâk Sûresi"
let surah65Turkish =    "Tahrim Sûresi"
let surah66Turkish =    "Mülk Sûresi"
let surah67Turkish =    "Kalem Sûresi"
let surah68Turkish =    "Hâkka Sûresi"
let surah69Turkish =    "Meâric Sûresi"
let surah70Turkish =    "Nuh Sûresi"
let surah71Turkish =    "Cin Sûresi"
let surah72Turkish =    "Müzzemmil Sûresi"
let surah73Turkish =    "Müddessir Sûresi"
let surah74Turkish =    "Kıyamet Sûresi"
let surah75Turkish =    "İnsan Sûresi"
let surah76Turkish =    "Mürselât Sûresi"
let surah77Turkish =    "Nebe' Sûresi"
let surah78Turkish =    "Nâziât Sûresi"
let surah79Turkish =    "Abese Sûresi"
let surah80Turkish =    "Tekvir Sûresi"
let surah81Turkish =    "İnfitâr Sûresi"
let surah82Turkish =    "Mutaffifin Sûresi"
let surah83Turkish =    "İnşikak Sûresi"
let surah84Turkish =    "Bürûc Sûresi"
let surah85Turkish =    "Târık Sûresi"
let surah86Turkish =    "A'lâ Sûresi"
let surah87Turkish =    "Gâşiye Sûresi"
let surah88Turkish =    "Fecr Sûresi"
let surah89Turkish =    "Beled Sûresi"
let surah90Turkish =    "Şems Sûresi"
let surah91Turkish =    "Leyl Sûresi"
let surah92Turkish =    "Duhâ Sûresi"
let surah93Turkish =    "İnşirâh Sûresi"
let surah94Turkish =    "Tin Sûresi"
let surah95Turkish =    "Alak Sûresi"
let surah96Turkish =    "Kadir Sûresi"
let surah97Turkish =    "Beyyine Sûresi"
let surah98Turkish =    "Zilzâl Sûresi"
let surah99Turkish =    "Âdiyât Sûresi"
let surah100Turkish =   "Kâria Sûresi"
let surah101Turkish =   "Tekâsür Sûresi"
let surah102Turkish =   "Asr Sûresi"
let surah103Turkish =   "Hümeze Sûresi"
let surah104Turkish =   "Fil Sûresi"
let surah105Turkish =   "Kureyş Sûresi"
let surah106Turkish =   "Mâûn Sûresi"
let surah107Turkish =   "Kevser Sûresi"
let surah108Turkish =   "Kâfirûn Sûresi"
let surah109Turkish =   "Nasr Sûresi"
let surah110Turkish =   "Tebbet Sûresi"
let surah111Turkish =   "İhlâs Sûresi"
let surah112Turkish =   "Felâk Sûresi"
let surah113Turkish =   "Nâs Sûresi"
let chapter1Turkish = "1. Cüz"
let chapter2Turkish = "2. Cüz"
let chapter3Turkish = "3. Cüz"
let chapter4Turkish = "4. Cüz"
let chapter5Turkish = "5. Cüz"
let chapter6Turkish = "6. Cüz"
let chapter7Turkish = "7. Cüz"
let chapter8Turkish = "8. Cüz"
let chapter9Turkish = "9. Cüz"
let chapter10Turkish = "10. Cüz"
let chapter11Turkish = "11. Cüz"
let chapter12Turkish = "12. Cüz"
let chapter13Turkish = "13. Cüz"
let chapter14Turkish = "14. Cüz"
let chapter15Turkish = "15. Cüz"
let chapter16Turkish = "16. Cüz"
let chapter17Turkish = "17. Cüz"
let chapter18Turkish = "18. Cüz"
let chapter19Turkish = "19. Cüz"
let chapter20Turkish = "20. Cüz"
let chapter21Turkish = "21. Cüz"
let chapter22Turkish = "22. Cüz"
let chapter23Turkish = "23. Cüz"
let chapter24Turkish = "24. Cüz"
let chapter25Turkish = "25. Cüz"
let chapter26Turkish = "26. Cüz"
let chapter27Turkish = "27. Cüz"
let chapter28Turkish = "28. Cüz"
let chapter29Turkish = "29. Cüz"
let chapter30Turkish = "30. Cüz"
let searchPlaceHolderTurkish = "Sure ismi veya cüzü yazin"
let goToPageButtonTitleTurkish = "Sayfaya Git"
