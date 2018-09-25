//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by iain Allen on 13/09/2018.
//  Copyright © 2018 iain Allen. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    @IBOutlet weak var previousBtn: FadeEnabledBtn!
    @IBOutlet weak var crawLbl: UITextView!
    
    
    
    
    
    
    var person: Person!
    let api = FilmsApi()
    var filmsArray = [String]()
    var currentFilm = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.name)
        filmsArray = person.filmUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = filmsArray.count > 1
        guard let firstFilm = filmsArray.first else { return }
        
        getFilms(url: firstFilm)

        // Do any additional setup after loading the view.
    }
    
    func getFilms(url: String) {
        api.getfilm(url: url) { (film) in
            if let film = film {
                self.setupView(film: film)
            }
        }
    }
    
    
    func setupView(film: Films) {
        titleLbl.text = film.title
        episodeLbl.text = String(film.episode_id)
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releasedLbl.text = film.release_date
        let stripped = film.opening_crawl.replacingOccurrences(of: "\n", with: " " )
        crawLbl.text = stripped.replacingOccurrences(of: "\r", with: "")
    }
    
    
    
    func setButtonState() {
        nextBtn.isEnabled = currentFilm == filmsArray.count - 1 ? false : true
        previousBtn.isEnabled = currentFilm == 0 ? false : true
        
        getFilms(url: filmsArray[currentFilm])
    }
    
    @IBAction func previousBtnClicked(_ sender: Any) {
        currentFilm -= 1
        setButtonState()
        print(filmsArray[currentFilm])
        
    }
    
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        currentFilm += 1
        setButtonState()
        print(filmsArray[currentFilm])
        
    }
    

    

}
