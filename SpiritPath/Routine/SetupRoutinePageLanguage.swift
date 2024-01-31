//
//  SetupRoutinePageLanguage.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 12/15/23.
//

import Foundation
//
//var alertTitleError = ""
//let alertTitleErrorEnglish  = "Error"
//let alertTitleErrorTurkish  = "Hata"
//
//var alertMessageError = ""
//let alertMessageErrorEnglish  = "Please make sure all fields are completed and select a category"
//let alertMessageErrorTurkish  = "Lütfen tüm alanların doldurulduğundan ve bir kategori seçildiğinden emin olun."
//
//var alertMessageRoutineNameError = ""
//let alertMessageRoutineNameErrorEnglish  = "The routine name is already taken. Please enter a new name."
//let alertMessageRoutineNameErrorTurkish  = "Bu rutin adı zaten alınmış. Lütfen yeni bir ad girin."
//
//var popoverYourGoal = ""
//let popoverYourGoalEnglish = "Your Goal"
//let popoverYourGoalTurkish = "Günlük Hedefin"
//
//var popoverroutineName = ""
//let popoverroutineNameEnglish = "Routine Name"
//let popoverroutineNameTurkish = "Rutin Adı"
//
//var deleteZikirRoutine = ""
//let deleteZikirRoutineEnglish  = "Delete Zikir"
//let deleteZikirRoutineTurkish  = "Zikiri Sil"
//
//var deleteZikirMessageRoutine = ""
//let deleteZikirMessageRoutineEnglish  = "Do you want to delete this routine permanently?"
//let deleteZikirMessageRoutineTurkish  = "Bu rutini kalıcı olarak silmek istiyor musunuz?"
//
//var cancelTitleRoutine = ""
//let cancelTitleRoutineEnglish  = "Cancel"
//let cancelTitleRoutineTurkish  = "İptal"
//
//var yesEvetRoutine = ""
//let yesEvetRoutineEnglish = "Yes"
//let yesEvetRoutineTurkish = "Evet"
//
//var IamSorryMessageRoutine = ""
//let IamSorryMessageRoutineEnglish = "I'm sorry, you cannot delete zikir from this tab."
//let IamSorryMessageRoutineTurkish = "Üzgünüm, bu sekmeden zikiri silemezsiniz."
//
//var toolTipRoutine = ""
//let toolTipRoutineEnglish = """
//             
//           Firstly, click on the '+' icon located at the top right corner of the page to create your routine.
//
//           The 'Now' values for your 'Zikir' routines are automatically calculated based on your interactions with the corresponding counters on the counter page; you cannot change them from here.
//
//           For 'Prayer' and 'Reading' routines, you'll need to manually make updates. Use the picker to select values.
//
//           If you wish to change the Goal values of your routines, click on the icon of the routine you want to modify.
//
//           Your daily and weekly reports will be generated based on the values you input here.
//          """
//let toolTipRoutineTurkish = """
//İlk olarak, rutininizi oluşturmak için sayfanın sağ üst köşesindeki '+' simgesine tıklayın.
//
//'Zikir' rutinlerinizin 'Mevcut' değerleri, sayaç sayfasındaki ilgili sayaçlarla etkileşiminize göre otomatik olarak hesaplanır; bunları buradan değiştiremezsiniz.
//
//'Namaz' ve 'Okuma' rutinleri için, güncelleme yapmak isterseniz manuel olarak yapmanız gerekecek. Değerleri girmek için seçiciyi kullanın.
//
//Rutinlerinizin Hedef değerlerini değiştirmek isterseniz, değiştirmek istediğiniz rutinin simgesine tıklayın.
//
//Günlük ve haftalık raporlarınız burada girdiğiniz değerlere göre oluşturulacaktır.
//"""
//
//
//
//var okRoutine = ""
//let okRoutineEnglish = "Ok"
//let okRoutineTurkish = "Tamam"
//
//
//func updateRoutinePageUIForSelectedLanguage() {
//        let selectedLanguage = LanguageManager.getSelectedLanguage()
//        if selectedLanguage == .english {
//            popoverYourGoal = popoverYourGoalEnglish
//            popoverroutineName = popoverroutineNameEnglish
//            alertMessageError = alertMessageErrorEnglish
//            alertMessageRoutineNameError = alertMessageRoutineNameErrorEnglish
//            deleteZikirRoutine = deleteZikirRoutineEnglish
//            deleteZikirMessageRoutine = deleteZikirMessageRoutineEnglish
//            cancelTitleRoutine = cancelTitleRoutineEnglish
//            yesEvetRoutine = yesEvetRoutineEnglish
//            toolTipRoutine = toolTipRoutineEnglish
//            IamSorryMessageRoutine = IamSorryMessageRoutineEnglish
//            okRoutine = okRoutineEnglish
//            
//        } else if selectedLanguage == .turkish {
//            popoverYourGoal = popoverYourGoalTurkish
//            popoverroutineName = popoverroutineNameTurkish
//            alertMessageError = alertMessageErrorTurkish
//            deleteZikirRoutine = deleteZikirRoutineTurkish
//            deleteZikirMessageRoutine = deleteZikirMessageRoutineTurkish
//            cancelTitleRoutine = cancelTitleRoutineTurkish
//            yesEvetRoutine = yesEvetRoutineTurkish
//            toolTipRoutine = toolTipRoutineTurkish
//            IamSorryMessageRoutine = IamSorryMessageRoutineTurkish
//            okRoutine = okRoutineTurkish
//        }
//    }
