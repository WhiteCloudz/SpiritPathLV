import Foundation



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
