//
//  MIT License
//  Copyright (c) 2020-2021 Raycast. All rights reserved.
//

import Foundation
import TSCBasic

extension Toolkit {
  public func generateDocumentation(outputJSONFilename: String, outputMarkdownFilename: String) throws {
    guard fileSystem.exists(extensionsAbsolutePath) else {
      throw Error.extensionsFolderNotFound(extensionsAbsolutePath.pathString)
    }

    var data = RaycastData()

    try readFolderContent(
      path: extensionsAbsolutePath,
      parentGroups: &data.groups,
      ignoreFilesInDir: true
    )

    data.totalScriptCommands = totalScriptCommands

    let documentation = Documentation(
      path: extensionsAbsolutePath,
      jsonFilename: outputJSONFilename,
      markdownFilename: outputMarkdownFilename
    )

    try documentation.generateDocuments(
      for: data
    )
  }
}
