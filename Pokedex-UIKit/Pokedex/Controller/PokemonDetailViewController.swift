//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by neyogiry on 22/12/21.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    static let pokemonBaselineHeight = CGFloat(50)
    
    private let pokemonInformationBackgroundColor: UIColor = .white
    private let cellWidth = 85.0
    private let cellHeight = 36.5

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var pokemonOrder: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var pokemonBaselineView: UIView!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var pokemonTypeCollectionView: UICollectionView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    private let presenter = PokemonDetailPresenter()
    
    var pokemon: Pokemon?
    var pokemonDetail: PokemonDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        getDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationController()
    }
    
    private func setupNavigationController() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setup() {
        self.presenter.delegate = self
        
        self.changeStatusBarColor(backgroundColor: pokemonInformationBackgroundColor)
        self.headerView.backgroundColor = pokemonInformationBackgroundColor
        self.pokemonBaselineView.backgroundColor = pokemonInformationBackgroundColor
        self.pokemonTypeCollectionView.backgroundColor = pokemonInformationBackgroundColor
        
        self.pokemonBaselineView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        
        self.pokemonOrder.text = ""
        self.pokemonLabel.text = pokemon?.name
        self.pokemonImageView.image = nil
        self.pokemonImageView.load(ImageHelper.pokemonImageUrl(pokemon?.url ?? "")) { image in
            if let color = image?.averageColor {
                self.changeStatusBarColor(backgroundColor: color)
                self.headerView.backgroundColor = color
            }
        }
    }
    
    private func getDetails() {
        if let url = pokemon?.url {
            presenter.fetchPokemonDetail(url: url)
        }
    }
    
    private func loadData() {
        if let pokemon = pokemonDetail {
            setupPokemonTypesCollectionView()
            self.weightLabel.text = String(format: "%.1f Kg", Double(pokemon.weight)/Double(10))
            self.heightLabel.text = String(format: "%.1f m", Double(pokemon.height)/Double(10))
        }
    }
    
    private func setupPokemonTypesCollectionView() {
        self.pokemonTypeCollectionView.dataSource = self
        self.pokemonTypeCollectionView.delegate = self
                
        self.pokemonTypeCollectionView.register(UINib(nibName: "PokemonTypeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "pokemonTypeCell")
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}

// MARK: - UICollectionViewDataSource
extension PokemonDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonDetail?.types.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonTypeCell", for: indexPath) as? PokemonTypeCollectionViewCell
        cell?.pokemonType.text = pokemonDetail?.types[indexPath.row].type.name
        cell?.backgroundColor = PokemonTypeHelper.typeColor(pokemonDetail?.types[indexPath.row].type.name ?? "")
        return cell!
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PokemonDetailViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let count = collectionView.numberOfItems(inSection: 0)
        let totalCellWidth = self.cellWidth * Double(count)
        let totalSpacingWidth: Double = 0 * Double(count - 1)

        let width = collectionView.frame.width
        let leftInset = (width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset

        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: self.cellWidth,
            height: self.cellHeight
        )
    }
    
}

// MARK: - PokemonDetailPresenterDelegate
extension PokemonDetailViewController: PokemonDetailPresenterDelegate {
    
    func didGetPokemonDetail(pokemon: PokemonDetail) {
        DispatchQueue.main.async {
            self.pokemonDetail = pokemon
            self.loadData()
        }
    }
    
    func didFailWithError(error: String) {
        print(error)
    }
    
    
}
