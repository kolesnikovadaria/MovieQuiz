//
//  ArrayTests.swift
//  ArrayTests
//
//  Created by Daria on 10.05.2026.
//

import XCTest

@testable import MovieQuiz

class ArrayTests: XCTestCase {
    
    func testGetValueInRange () throws {
        // Given
        let array = [1, 1, 2, 3, 5]
        // When
        let value = array[safe: 2]
        // Then
        XCTAssertNotNil(value)
        XCTAssertEqual(value, 2)
    }
    
    func testGetValueOutOfRange () throws {
        // Given
        let array = [1, 1, 2, 3, 5]
        // When
        let value = array[safe: 20]
        // Then
        XCTAssertNil(value)
    }
    
    struct MoviesLoader: MoviesLoading {
        // MARK: - NetworkClient
        private let networkClient = NetworkClient()
        
        // MARK: - URL
        private var mostPopularMoviesUrl: URL {
            guard let url = URL(string: "https://tv-api.com/en/API/Top250Movies/k_zcuw1ytf") else {
                preconditionFailure("Unable to construct mostPopularMoviesUrl")
            }
            return url
        }
        
        func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void) {
            networkClient.fetch(url: mostPopularMoviesUrl) { result in
                switch result {
                case .success(let data):
                    do {
                        let mostPopularMovies = try JSONDecoder().decode(MostPopularMovies.self, from: data)
                        handler(.success(mostPopularMovies))
                    } catch {
                        handler(.failure(error))
                    }
                case .failure(let error):
                    handler(.failure(error))
                }
            }
        }
    }
}
