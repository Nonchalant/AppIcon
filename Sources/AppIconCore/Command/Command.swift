import Foundation
import SwiftShell

enum Command {
    case createDirectory(output: String)
    case extractImage(base: String, output: String, size: Float)
    case createJSON(json: String, output: String)

    func execute() throws {
        switch self {
        case .createDirectory(let output):
            try execute("/bin/mkdir", "-p", output)
        case .extractImage(let base, let output, let size):
            try execute("/usr/bin/sips", "-Z", "\(size)", base, "--out", output)
        case .createJSON(let json, let output):
            let writefile = try open(forWriting: output, overwrite: true)
            writefile.write(json)
            writefile.close()
        }
    }

    private func execute(_ executable: String, _ args: String...) throws {
        let runOutput = run(executable, args)

        guard runOutput.succeeded else {
            throw LocalError.execution
        }
    }
}
