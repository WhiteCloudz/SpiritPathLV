//
//  QuranFihrist.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 1/6/24.
//

import Foundation
import UIKit

extension ReadBookPage: UISearchBarDelegate {
    @objc func showPopupMenu() {
        dismiss(animated: true, completion: nil)
        
        let popoverContent = UIViewController()
        popoverContent.modalPresentationStyle = .popover
        popoverContent.preferredContentSize = CGSize(width: 275, height: 580)
        popoverContent.view.backgroundColor = .clear
        setupBackroundImageToVievController(imageNamed: "backround-5" , backroundView: popoverContent.view)
        
        // Go to page button
        let goToPageButton = createButton(title: goToPageButtonTitle, frame: CGRect(x: 50, y: 20, width: 175, height: 40), target: #selector(showPageSelectionAlert))
        goToPageButton.backgroundColor = UIColor(hex: "201B4D")
        goToPageButton.tintColor = .white
        goToPageButton.layer.cornerRadius = goToPageButton.bounds.height / 2
        popoverContent.view.addSubview(goToPageButton)
        
        // Search bar
        let searchBar = createSearchBar(frame: CGRect(x: 5, y: 70, width: 265, height: 50))
        popoverContent.view.addSubview(searchBar)
        
        // Scroll view
        let scrollView = createScrollView(frame: CGRect(x: 0, y: 130, width: 275, height: 520), titles: titles)
        popoverContent.view.addSubview(scrollView)
        
        // Present popover
        presentPopover(viewController: popoverContent)
    }

    func createButton(title: String, frame: CGRect, target: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.frame = frame
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = button.bounds.height / 5
        button.backgroundColor = .clear 
        button.tintColor =  UIColor(hex: "201B4D")
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: target, for: .touchUpInside)
        return button
    }

    func createSearchBar(frame: CGRect) -> UISearchBar {
        let searchBar = UISearchBar(frame: frame)
        searchBar.delegate = self
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = searchPlaceHolder
        searchBar.backgroundColor = .clear
        return searchBar
    }

    func createScrollView(frame: CGRect, titles: [String]) -> UIScrollView {
        let scrollView = UIScrollView(frame: frame)
        updateScrollView(with: titles, in: scrollView)
        return scrollView
    }

    func updateScrollView(with titlesToShow: [String], in scrollView: UIScrollView) {
        scrollView.subviews.forEach { $0.removeFromSuperview() }
        
        var yPos: CGFloat = 0
        let buttonHeight: CGFloat = 40
        
        for title in titlesToShow {
            let button = createButton(title: title, frame: CGRect(x: 15, y: yPos, width: 240, height: buttonHeight), target: #selector(buttonTapped(_:)))
            scrollView.addSubview(button)
            yPos += buttonHeight + 10
        }
        
        scrollView.contentSize = CGSize(width: 250, height: yPos)
    }

    func presentPopover(viewController: UIViewController) {
        let popoverController = viewController.popoverPresentationController
        popoverController?.delegate = self
        popoverController?.permittedArrowDirections = []
        
        let screenWidth = UIScreen.main.bounds.width
        let scaledWidth: CGFloat = 250
        let rightMargin: CGFloat = 0
        let topMargin: CGFloat = 100
        
        popoverController?.sourceView = self.view
        popoverController?.sourceRect = CGRect(x: screenWidth - scaledWidth - rightMargin, y: topMargin, width: scaledWidth, height: 0)
        
        present(viewController, animated: true, completion: nil)
    }

    @objc func buttonTapped(_ sender: UIButton) {
        if let presentedVC = presentedViewController {
            presentedVC.dismiss(animated: true, completion: nil)
        }
        guard let title = sender.currentTitle else { return }
        goToPDFPage(title: title)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let filteredTitles: [String]
        
        if searchText.isEmpty {
            filteredTitles = titles
        } else {
            filteredTitles = titles.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
        
        if let scrollView = searchBar.superview?.subviews.compactMap({ $0 as? UIScrollView }).first {
            updateScrollView(with: filteredTitles, in: scrollView)
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Search Bar'ın iptal edilmesi durumunda tüm başlıkları göster
        if let scrollView = searchBar.superview?.subviews.compactMap({ $0 as? UIScrollView }).first {
            updateScrollView(with: titles, in: scrollView)
        }
    }
    
    
    func goToPDFPage(title: String) {
        
        var pageNumber = 0
        switch title {
            case surahFatiha:
                pageNumber = 1
            case surah1:
                pageNumber = 1
            case surah2:
                pageNumber = 49
            case surah3:
                pageNumber = 76
            case surah4:
                pageNumber = 105
            case surah5:
                pageNumber = 127
            case surah6:
                pageNumber = 150
            case surah7:
                pageNumber = 176
            case surah8:
                pageNumber = 186
            case surah9:
                pageNumber = 207
            case surah10:
                pageNumber = 220
            case surah11:
                pageNumber = 234
            case surah12:
                pageNumber = 248
            case surah13:
                pageNumber = 254
            case surah14:
                pageNumber = 261
            case surah15:
                pageNumber = 266
            case surah16:
                pageNumber = 281
            case surah17:
                pageNumber = 292
            case surah18:
                pageNumber = 304
            case surah19:
                pageNumber = 311
            case surah20:
                pageNumber = 321
            case surah21:
                pageNumber = 331
            case surah22:
                pageNumber = 341
            case surah23:
                pageNumber = 349
            case surah24:
                pageNumber = 357
            case surah25:
                pageNumber = 366
            case surah26:
                pageNumber = 376
            case surah27:
                pageNumber = 384
            case surah28:
                pageNumber = 395
            case surah29:
                pageNumber = 403
            case surah30:
                pageNumber = 410
            case surah31:
                pageNumber = 414
            case surah32:
                pageNumber = 417
            case surah33:
                pageNumber = 427
            case surah34:
                pageNumber = 433
            case surah35:
                pageNumber = 439
            case surah36:
                pageNumber = 445
            case surah37:
                pageNumber = 452
            case surah38:
                pageNumber = 457
            case surah39:
                pageNumber = 466
            case surah40:
                pageNumber = 476
            case surah41:
                pageNumber = 482
            case surah42:
                pageNumber = 488
            case surah43:
                pageNumber = 490
            case surah44:
                pageNumber = 492
            case surah45:
                pageNumber = 501
            case surah46:
                pageNumber = 506
            case surah47:
                pageNumber = 510
            case surah48:
                pageNumber = 514
            case surah49:
                pageNumber = 517
            case surah50:
                pageNumber = 519
            case surah51:
                pageNumber = 522
            case surah52:
                pageNumber = 525
            case surah53:
                pageNumber = 527
            case surah54:
                pageNumber = 530
            case surah55:
                pageNumber = 533
            case surah56:
                pageNumber = 536
            case surah57:
                pageNumber = 541
            case surah58:
                pageNumber = 544
            case surah59:
                pageNumber = 546
            case surah60:
                pageNumber = 550
            case surah61:
                pageNumber = 552
            case surah62:
                pageNumber = 553
            case surah63:
                pageNumber = 555
            case surah64:
                pageNumber = 557
            case surah65:
                pageNumber = 559
            case surah66:
                pageNumber = 561
            case surah67:
                pageNumber = 563
            case surah68:
                pageNumber = 565
            case surah69:
                pageNumber = 567
            case surah70:
                pageNumber = 569
            case surah71:
                pageNumber = 571
            case surah72:
                pageNumber = 573
            case surah73:
                pageNumber = 574
            case surah74:
                pageNumber = 576
            case surah75:
                pageNumber = 577
            case surah76:
                pageNumber = 579
            case surah77:
                pageNumber = 581
            case surah78:
                pageNumber = 582
            case surah79:
                pageNumber = 584
            case surah80:
                pageNumber = 585
            case surah81:
                pageNumber = 586
            case surah82:
                pageNumber = 587
            case surah83:
                pageNumber = 588
            case surah84:
                pageNumber = 589
            case surah85:
                pageNumber = 590
            case surah86:
                pageNumber = 591
            case surah87:
                pageNumber = 591
            case surah88:
                pageNumber = 592
            case surah89:
                pageNumber = 593
            case surah90:
                pageNumber = 594
            case surah91:
                pageNumber = 595
            case surah92:
                pageNumber = 595
            case surah93:
                pageNumber = 596
            case surah94:
                pageNumber = 596
            case surah95:
                pageNumber = 597
            case surah96:
                pageNumber = 598
            case surah97:
                pageNumber = 598
            case surah98:
                pageNumber = 599
            case surah99:
                pageNumber = 599
            case surah100:
                pageNumber = 600
            case surah101:
                pageNumber = 600
            case surah102:
                pageNumber = 601
            case surah103:
                pageNumber = 601
            case surah104:
                pageNumber = 601
            case surah105:
                pageNumber = 602
            case surah106:
                pageNumber = 602
            case surah107:
                pageNumber = 602
            case surah108:
                pageNumber = 603
            case surah109:
                pageNumber = 603
            case surah110:
                pageNumber = 603
            case surah111:
                pageNumber = 604
            case surah112:
                pageNumber = 604
            case surah113:
                pageNumber = 604
        case chapter1:
            pageNumber = 1
        case chapter2:
            pageNumber = 21
        case chapter3:
            pageNumber = 41
        case chapter4:
            pageNumber = 61
        case chapter5:
            pageNumber = 81
        case chapter6:
            pageNumber = 101
        case chapter7:
            pageNumber = 121
        case chapter8:
            pageNumber = 141
        case chapter9:
            pageNumber = 161
        case chapter10:
            pageNumber = 181
        case chapter11:
            pageNumber = 201
        case chapter12:
            pageNumber = 221
        case chapter13:
            pageNumber = 241
        case chapter14:
            pageNumber = 261
        case chapter15:
            pageNumber = 281
        case chapter16:
            pageNumber = 301
        case chapter17:
            pageNumber = 321
        case chapter18:
            pageNumber = 241
        case chapter19:
            pageNumber = 361
        case chapter20:
            pageNumber = 381
        case chapter21:
            pageNumber = 401
        case chapter22:
            pageNumber = 421
        case chapter23:
            pageNumber = 441
        case chapter24:
            pageNumber = 461
        case chapter25:
            pageNumber = 481
        case chapter26:
            pageNumber = 501
        case chapter27:
            pageNumber = 521
        case chapter28:
            pageNumber = 541
        case chapter29:
            pageNumber = 561
        case chapter30:
            pageNumber = 581
            default:
                break
        }
        
        if let pdfDocument = pdfView.document {
            if let pdfPage = pdfDocument.page(at: pageNumber + 1) {
                pdfView.go(to: pdfPage)
            }
        }
    }

    
}



