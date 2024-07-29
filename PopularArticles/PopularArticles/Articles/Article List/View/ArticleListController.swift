//
//  ViewController.swift
//  PopularArticles
//
//  Created by nargis hameed on 28/07/2024.
//

import UIKit
class ArticleListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    lazy var viewModel: ArticlesListViewModel = {
        return ArticlesListViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        initVM()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = Strings.homeTitle

    }
    //Mark: Setup View Methods
    func setupUI() {
        tableView.register(UINib(nibName: Cells.topStoryListCellId, bundle: nil), forCellReuseIdentifier: Cells.topStoryListCellId)
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.accessibilityIdentifier = "tableView"
        activityIndicator.accessibilityIdentifier = "activityIndicator"
    }
    
    func initVM() {
        
        viewModel.showAlertHandler = { [weak self] () in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    self?.showAlert( message )
                }
            }
        }
        
        viewModel.updateLoadingStatus = { [weak self] () in
            DispatchQueue.main.async {
                let isLoading = self?.viewModel.isLoading ?? false
                if isLoading {
                    self?.activityIndicator.startAnimating()
                    UIView.animate(withDuration: 0.2, animations: {
                        self?.tableView.alpha = 0.0
                    })
                }else {
                    self?.activityIndicator.stopAnimating()
                    UIView.animate(withDuration: 0.2, animations: {
                        self?.tableView.alpha = 1.0
                    })
                }
            }
        }
        
        viewModel.reloadTableVwHandler = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.initFetch()
        
    }
    
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: Strings.alertTitle, message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ArticleListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.topStoryListCellId , for: indexPath) as? ArticleRowCellTableViewCell else {
            fatalError("Cell not exists in storyboard")
        }
        
        let cellVM = viewModel.getCellViewModel( at: indexPath )
        
        
        cell.heading.text = cellVM.titleText
        cell.descp.text = cellVM.authorText
        cell.timelb.text = cellVM.dateTime
        cell.imageVw.makeRoundedView()
        cell.imageVw.imageFromServerURL(cellVM.imageUrl ?? "",placeHolder: UIImage(named: "placeholder"))
    
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        self.viewModel.showArticleDetails(at: indexPath)
        return indexPath
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: SegueIdentifier.showDetailSegue, sender: indexPath)
        }
}

extension ArticleListController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ArticleDetailViewController,
            let selectedArticle = viewModel.selectedArticle {
            vc.viewModel = selectedArticle
            
            
        }
    }
}




