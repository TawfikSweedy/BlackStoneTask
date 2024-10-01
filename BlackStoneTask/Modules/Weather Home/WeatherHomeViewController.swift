//
//  WeatherHomeViewController.swift
//  BlackStoneTask
//
//  Created by  Tawfik Sweedy✌️ on 30/09/2024.
//

import UIKit
import SDWebImage

class WeatherHomeViewController: UIViewController , WeatherHomeViewProtocol , ErrorProtocol {
    // MARK: - IBOutlet
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var citiesTableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var conditionImg: UIImageView!
    @IBOutlet weak var tempratureLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var todayConditionImg: UIImageView!
    @IBOutlet weak var todayTempretureLabel: UILabel!
    @IBOutlet weak var tomorrowImg: UIImageView!
    @IBOutlet weak var tomorrowTempretureLabel: UILabel!
    @IBOutlet weak var afterTomorrowImg: UIImageView!
    @IBOutlet weak var afterTomorrowTempLabel: UILabel!
    @IBOutlet weak var afterTomorrowTitleLabel: UILabel!
    @IBOutlet weak var daysCollectionView: UICollectionView!
    //MARK: - variables
    var presenter: WeatherHomePresenterProtocol?
    var observe : NSKeyValueObservation?
    var citiesData = [searchModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        setupCollectionView()
        presenter?.viewDidLoad()
        presenter?.ReloadForeCasts()
    }
    // MARK: - Private functions
    private func setupUI() {
        searchView.isHidden = true
        self.observe = self.citiesTableView.observe(\.contentSize) { (tableView, _) in
            self.tableHeight.constant = self.citiesTableView.contentSize.height
        }
    }
    // MARK: - TableView Setup
    private func setupTableView() {
        citiesTableView.dataSource = self
        citiesTableView.delegate = self
        citiesTableView.RegisterNib(cell: SearchTableViewCell.self)
    }
    // MARK: - CollectionView Setup
    private func setupCollectionView() {
        daysCollectionView.dataSource = self
        daysCollectionView.delegate = self
        daysCollectionView.RegisterNib(cell: DayCollectionViewCell.self)
    }
    func ShowForeCasts(_ data: ForeCastModel) {
        self.timeLabel.text = data.location?.localtime
        self.cityNameLabel.text = data.location?.name
        self.dateLabel.text = data.current?.last_updated
        self.conditionImg.sd_setImage(with: URL(string: "https:\(data.current?.condition?.icon ?? "")") , completed: nil)
        self.statusLabel.text = data.current?.condition?.text
        self.tempratureLabel.text = "\(data.current?.temp_c ?? 0.0)"
        self.windLabel.text = "\(data.current?.wind_mph ?? 0.0) mph"
        self.rainLabel.text = "\(data.current?.humidity ?? 0) %"
//        self.todayConditionImg.sd_setImage(with: URL(string: "https:\(data.forecast?.forecastday?[0].day?.condition?.icon ?? "")") , completed: nil)
//        self.tomorrowImg.sd_setImage(with: URL(string: "https:\(data.forecast?.forecastday?[1].day?.condition?.icon ?? "")") , completed: nil)
//        self.afterTomorrowImg.sd_setImage(with: URL(string: "https:\(data.forecast?.forecastday?[2].day?.condition?.icon ?? "")") , completed: nil)
//        self.todayTempretureLabel.text = "\(data.forecast?.forecastday?[0].day?.avghumidity ?? 0.0)°/\(data.forecast?.forecastday?[0].day?.mintemp_c ?? 0.0)°C - \(data.forecast?.forecastday?[0].day?.maxtemp_c ?? 0.0)°C"
//        self.tomorrowTempretureLabel.text = "\(data.forecast?.forecastday?[1].day?.avghumidity ?? 0.0)°/\(data.forecast?.forecastday?[1].day?.mintemp_c ?? 0.0)°C - \(data.forecast?.forecastday?[1].day?.maxtemp_c ?? 0.0)°C"
//        self.afterTomorrowTempLabel.text = "\(data.forecast?.forecastday?[2].day?.avghumidity ?? 0.0)°/\(data.forecast?.forecastday?[2].day?.mintemp_c ?? 0.0)°C - \(data.forecast?.forecastday?[2].day?.maxtemp_c ?? 0.0)°C"
//        self.afterTomorrowTitleLabel.text = data.forecast?.forecastday?[2].date
        self.daysCollectionView.reloadData()
    }
    func ShowCities(_ data: [searchModel]) {
        self.citiesData = data
        self.citiesTableView.reloadData()
    }
    func featching(error: String) {
        AlertPresenter.displayToast(title: "Please Check" , message: "\(error)", type: .error)
    }
    // MARK: - IBAction functions
    @IBAction func searchTextFieldChangeAction(_ sender: Any) {
        presenter?.getCities(searchTextField.text ?? "Cairo")
    }
    @IBAction func searchAction(_ sender: Any) {
        UIView.transition(with: searchView, duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            self.searchView.isHidden = false
        })
    }
    @IBAction func cancelAction(_ sender: Any) {
        searchTextField.text = ""
    }
    @IBAction func backAction(_ sender: Any) {
        presenter?.viewDidLoad()
        UIView.transition(with: searchView, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            self.searchView.isHidden = true
        })
    }
}
