//
//  ProductCell.swift
//  Products MVVM
//
//  Created by Preet Pambhar on 2024-05-04.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productimageView: UIImageView!
    @IBOutlet weak var productBackgroundView: UIView!
    
    @IBOutlet weak var productTitleLabel: UILabel!
    
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var product: Product? {
        didSet {
            //property observer
            productDetailConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productBackgroundView.clipsToBounds = false
        productBackgroundView.layer.cornerRadius = 15
        
        productBackgroundView.layer.cornerRadius = 10
        
        self.productBackgroundView.backgroundColor = .systemGray6
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailConfiguration(){
        guard let product else {return}
        productTitleLabel.text = product.title
        productCategoryLabel.text = product.category
        descriptionLabel.text = product.description
        priceLabel.text = "$\(product.price)"
        rateButton.setTitle("\(product.rating.rate)", for: .normal)
        productimageView.SetImage(With: product.image)
    }
    
}
