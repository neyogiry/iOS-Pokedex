//
//  ViewController.swift
//  Pokedex
//
//  Created by neyogiry on 13/12/21.
//

import UIKit
import AlamofireImage

class PokedexViewController: UIViewController {

    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    private let presenter = PokedexPresenter()
    
    private let itemsPerRow: CGFloat = 2
    
    private var pokemonList: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
        setupCollectionView()
        getPokedex()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationController()
    }
    
    private func setupNavigationController() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 213.0/255, green: 59.0/255, blue: 71.0/255, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    private func setupCollectionView() {
        pokemonCollectionView.dataSource = self
        pokemonCollectionView.delegate = self
        
        pokemonCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        pokemonCollectionView.register(UINib(nibName: "PokemonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "pokemonCell")
    }
    
    private func getPokedex() {
        presenter.fetchPokedex()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pokemonDetailVC" {
            if let pdController = segue.destination as? PokemonDetailViewController {
                if let index = pokemonCollectionView.indexPathsForSelectedItems?.first {
                    pdController.pokemon = pokemonList[index.row]
                }
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

// MARK: - UICollectionViewDataSource
extension PokedexViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as? PokemonCollectionViewCell
        cell?.pokemonName.text = pokemonList[indexPath.row].name
        cell?.pokemonImage.load(ImageHelper.pokemonImageUrl(pokemonList[indexPath.row].url)) { image in
            cell?.backgroundColor = image?.averageColor
        }
        return cell!
    }
    
}

// MARK: - UICollectionViewDelegate
extension PokedexViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pokemonDetailVC", sender: self)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PokedexViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {        
        let collectionWidth = collectionView.frame.width
        let collectionHeight = collectionView.frame.height        
        let paddingSpace = PokemonCollectionViewCell.sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionWidth - paddingSpace
        let myCellWidth = availableWidth / itemsPerRow
        let myCellHeight = collectionHeight / 3.5
            
        return CGSize(width: myCellWidth, height: myCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return PokemonCollectionViewCell.sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return PokemonCollectionViewCell.sectionInsets.left
    }

}

// MARK: - PokedexPresenterDelegate
extension PokedexViewController: PokedexPresenterDelegate {
    
    func didGetPokedex(pokedex: Pokedex) {
        DispatchQueue.main.async {
            self.pokemonList.insert(contentsOf: pokedex.pokemon, at: 0)
            self.pokemonCollectionView.reloadData()
        }
    }
    
    func didFailWithError(error: String) {
        print(error)
    }
    
    
}
