Pod::Spec.new do |s|
    s.name         = "LBExpandedCollectionViewFramework"
    s.version      = "0.0.2"
    s.summary      = "LBExpandedCollectionView: Lioz Balki ExpandedCollectionView Framework"
    
    s.description  = <<-DESC
                   The Lioz Balki SDK for iOS ExpandedCollectionView framework provides:
                   * LBExpandedCollectionView with Expanded Cells
                   DESC
    
    s.homepage  = "https://github.com/lioz12131415/LBExpandedCollectionView.git"
    s.readme    = "https://raw.github.com/lioz12131415/LBExpandedCollectionView/main/README.md"
    
    s.license = {
        :type => "MIT", :file => "LICENSE"
    }
    s.author = {
        "Lioz Balki" => "lioz12131415@gmail.com"
    }
    s.source = {
        :git => "https://github.com/lioz12131415/LBExpandedCollectionView.git", :tag => "#{s.version}"
    }
    
    s.platform               = :ios
    s.requires_arc           = true
    s.swift_version          = "5.0"
    s.vendored_frameworks    = "LBExpandedCollectionViewFramework.xcframework"
    s.ios.deployment_target  = '14.0'
    
    s.resources     = 'LBExpandedCollectionViewFramework/**/*.{h,m,folder,xcassets,mp4,ttf,xcframework}'
    s.source_files  = "LBExpandedCollectionViewFramework", "LBExpandedCollectionViewFramework/**/*.{h,m,swift,folder,storyboard,strings,xcdatamodeld,xib,ttf,xcframework}"

end
