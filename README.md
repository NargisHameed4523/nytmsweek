

# NY Times Most Popular Articles

## Description

This project is a simple iOS app that fetches and displays the most popular articles from the New York Times API. The app uses the NY Times Most Popular Articles API to show a list of articles in a `UITableView`, and displays detailed information about each article when tapped, implementing a typical master/detail interface.

### API Endpoint

The app uses the following NY Times API endpoint:

http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?api-key=sample-key


- **`{section}`**: Replace with the section you want to query (e.g., `all-sections`).
- **`{period}`**: Replace with the period you want to query (e.g., `7` for the past 7 days).
- **`api-key`**: Replace with your actual API key.

## Features

- Fetches and displays a list of most popular articles.
- Supports tapping on an article to view detailed information.
- Utilizes the NY Times API for data retrieval.

## Setup

1. **Clone the Repository:**

   ```sh
   git clone https://github.com/your-username/ny-times-most-popular-articles.git

Open the Project:
Open the .xcodeproj  file in Xcode.
Update API Key:
	•	Open NetworkService.swift (or the relevant file where API key is used).
	•	Replace sample-key with your actual NY Times API key.

Note : To use the NY Times API, you'll need an API key. You can obtain one by signing up at the NY Times Developer Portal. Replace sample-key in the API URL with your actual API key.

Run the Project:
Select a simulator or connected device and click the "Run" button in Xcode.

## Architecture MVVM (Model-View-ViewModel)
	## Model: Represents the data and network operations (e.g., Article.swift).
	## View: Manages the user interface and binds to the ViewModel (e.g., ArticleListViewController.swift, ArticleDetailViewController.swift).
	## ViewModel: Handles the presentation logic and data transformation (e.g., ArticleListViewModel.swift, ArticleDetailViewModel.swift).


## Contribution
Contributions are welcome! Please feel free to open an issue or submit a pull request for any improvements or bug fixes.
License
This project is licensed under the [MIT License](https://opensource.org/licenses/MIT). See the [LICENSE](https://github.com/NargisHameed4523/nytmsweek/blob/main/LICENSE). file for details.



