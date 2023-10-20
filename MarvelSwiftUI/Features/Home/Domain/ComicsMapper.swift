//
//  ComicsMapper.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 20/10/2023.
//

import Foundation

struct ComicsMapper {
    static func mapData(response: MarvelHomeResponse) -> [Comic]{
        return response.data?.results?.map({ data in
            return Comic(id: data.id, title: data.title, description: data.description, thumbnail: mapImage(data: data.thumbnail), images: mapImages(dataList: data.images))
        }) ?? []
    }
    
    static func mapImages(dataList: [ComicImageData]?) -> [ComicImage?]? {
        guard let dataList else {
            return nil
        }
        return dataList.map { data in
            return mapImage(data: data)
        }
    }
    
    static func mapImage(data: ComicImageData?) -> ComicImage? {
        guard let data else {
            return nil
        }
        return ComicImage(path: data.path, fileExtension: data.fileExtension)
    }
}
