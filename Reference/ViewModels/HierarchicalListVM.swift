//
//  HierarchicalListVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/26/22.
//

import SwiftUI

class HierarchicalListVM: ObservableObject {
    @Published var pathRefs: [PathRef] = [
        PathRef(
            title: "Psych.2006",
            icon: "folder",
            children: [
                PathRef(
                    title: "Season.01",
                    icon: "folder",
                    children: [
                        PathRef(
                            title: "S01E01.mkv",
                            icon: "doc.fill",
                            children: nil
                        ),
                        PathRef(
                            title: "S01E02.mkv",
                            icon: "doc.fill",
                            children: nil
                        ),
                        PathRef(
                            title: "S01E03.mkv",
                            icon: "doc.fill",
                            children: nil
                        )
                    ]
                ),
                PathRef(
                    title: "Season.02",
                    icon: "folder",
                    children: [
                        PathRef(
                            title: "S02E01.mkv",
                            icon: "doc.fill",
                            children: nil
                        ),
                        PathRef(
                            title: "S02E02.mkv",
                            icon: "doc.fill",
                            children: nil
                        ),
                        PathRef(
                            title: "S02E03.mkv",
                            icon: "doc.fill",
                            children: nil
                        )
                    ]
                ),
                PathRef(
                    title: "Season.03",
                    icon: "folder",
                    children: [
                        PathRef(
                            title: "S03E01.mkv",
                            icon: "doc.fill",
                            children: nil
                        ),
                        PathRef(
                            title: "S03E02.mkv",
                            icon: "doc.fill",
                            children: nil
                        ),
                        PathRef(
                            title: "S03E03.mkv",
                            icon: "doc.fill",
                            children: nil
                        )
                    ]
                ),
                PathRef(
                    title: "S1-Info.txt",
                    icon: "doc.fill",
                    children: nil
                ),
                PathRef(
                    title: "S2-Info.txt",
                    icon: "doc.fill",
                    children: nil
                ),
                PathRef(
                    title: "S3-Info.txt",
                    icon: "doc.fill",
                    children: nil
                )
            ]
        ),
        PathRef(
            title: "README.md",
            icon: "doc.fill",
            children: nil
        )
    ]
}
