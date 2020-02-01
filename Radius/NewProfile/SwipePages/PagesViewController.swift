//
//  PagesViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/19/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit

class PagesViewController: UIPageViewController {

    internal lazy var pages: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pageOne = storyboard.instantiateViewController(identifier: "PageOneViewController")
        let pageFour = storyboard.instantiateViewController(identifier: "PageFourViewController")
        
        return [pageOne, pageFour]
    }()
    
    let pageControl: UIPageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        dataSource = self
        delegate = self
        
        pageControl.numberOfPages = pages.count
        view.addSubview(pageControl)
        view.bringSubviewToFront(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.tintColor = .blue
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .gray
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let firstPage = pages.first {
            setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }
    }
}
extension PagesViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard pages.count > previousIndex else { return nil}
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        guard pages.count != nextIndex else { return nil }
        guard pages.count > nextIndex else { return nil }
        return pages[nextIndex]
    }
}

extension PagesViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        let currentPageVC = pageViewController.viewControllers![0]
        
        let currentPage = pages.firstIndex(of: currentPageVC)  ?? 0
        pageControl.currentPage = currentPage
    }
}
