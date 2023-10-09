//
//  TitlePreviewViewController.swift
//  Movie like Netflix
//
//  Created by Luyện Hà Luyện on 02/10/2023.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private let movieGenreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .cyan
        return label
    }()
    private let voteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .orange
        return label
    }()
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .magenta
        return label
    }()
    private let overviewTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 20, weight: .regular)
        textView.isEditable = false
        textView.isSelectable = true
        return textView
    }()
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tải xuống", for: .normal)
        button.layer.cornerRadius = 15
        if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
            button.setTitleColor(.white, for: .normal)
        } else if UIScreen.main.traitCollection.userInterfaceStyle == .light {
            button.setTitleColor(.black, for: .normal)
        }
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Trở về", style: .plain, target: self, action: #selector(backButtonTapped))
        
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(movieGenreLabel)
        view.addSubview(voteLabel)
        view.addSubview(dateLabel)
        view.addSubview(overviewTextView)
        view.addSubview(downloadButton)
        
        configureConstraints()
    }
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    func configureConstraints() {
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: view.frame.width / 1.618)
        ]
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        let movieGenreLabelConstraints = [
            movieGenreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            movieGenreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            movieGenreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        let voteLabelConstraints = [
            voteLabel.topAnchor.constraint(equalTo: movieGenreLabel.bottomAnchor, constant: 0),
            voteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            voteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        let dateLabelConstraints = [
            dateLabel.topAnchor.constraint(equalTo: voteLabel.bottomAnchor, constant: 0),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        let overviewTVConstraints = [
            overviewTextView.topAnchor.constraint(equalTo: voteLabel.bottomAnchor, constant: 25),
            overviewTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            overviewTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overviewTextView.heightAnchor.constraint(equalToConstant: 120)
        ]
        let downloadButtonConstraints = [
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.topAnchor.constraint(equalTo: overviewTextView.bottomAnchor, constant: 25),
            downloadButton.widthAnchor.constraint(equalToConstant: 140),
            downloadButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(movieGenreLabelConstraints)
        NSLayoutConstraint.activate(voteLabelConstraints)
        NSLayoutConstraint.activate(dateLabelConstraints)
        NSLayoutConstraint.activate(overviewTVConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    func configure(with model: TitlePreviewViewModel) {
        titleLabel.text = model.title
        overviewTextView.text = "Nội dung: \(model.titleOverview)"
        guard let genreInt = model.genre_ids else { return }
        var genreString: [String] = [String]()
        for i in genreInt {
            switch i {
            case 28:
                genreString.append("Hành động")
            case 12:
                genreString.append("Phiêu lưu")
            case 16:
                genreString.append("Hoạt hình")
            case 35:
                genreString.append("Hài")
            case 80:
                genreString.append("Phạm tội")
            case 99:
                genreString.append("Tài liệu")
            case 18:
                genreString.append("Kịch tính")
            case 10751:
                genreString.append("Gia đình")
            case 14:
                genreString.append("Kỳ lạ")
            case 27:
                genreString.append("Rùng rợn")
            case 10402:
                genreString.append("Âm nhạc")
            case 9648:
                genreString.append("Huyền bí")
            case 10749:
                genreString.append("Mơ mộng")
            case 878:
                genreString.append("Khoa hoc viễn tưởng")
            case 53:
                genreString.append("Giật gân")
            case 10752:
                genreString.append("Chiến tranh")
            case 37:
                genreString.append("Cao bồi")
            default:
                genreString.append("Đang cập nhật")
            }
        }
        movieGenreLabel.text = "Thể loại: \(genreString.joined(separator: ", "))"
        voteLabel.text = "Điểm số: \(model.vote_average ?? 0)/10  (\(model.vote_count ?? 0) Bình chọn)"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: model.release_date ?? "0000-00-00") {
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let formatterDate = dateFormatter.string(from: date)
            if formatterDate == "00-00-0000" {
                dateLabel.text = "Ngày phát hành: Đang cập nhật"
            } else {
                dateLabel.text = "Ngày phát hành: \(formatterDate)"
            }
        }
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
            return
        }
        webView.load(URLRequest(url: url))
    }
}
