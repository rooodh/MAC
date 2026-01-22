import SwiftUI

struct CommandInstructionsView: View {
    let command: String
    let onCopy: () -> Void
    let onOpenTerminal: () -> Void
    let onDismiss: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            HStack {
                Text("Command Instructions")
                    .font(.headline)
                Spacer()
                Button(action: onDismiss) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .buttonStyle(.plain)
            }
            .padding()
            
            Divider()
            
            // Instructions
            VStack(alignment: .leading, spacing: 15) {
                Text("This command requires administrator privileges.")
                    .font(.headline)
                
                Text("Follow these steps:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                VStack(alignment: .leading, spacing: 10) {
                    StepView(number: 1, text: "Click 'Open Terminal' below or open Terminal manually")
                    StepView(number: 2, text: "Paste the command (⌘+V) or copy it using 'Copy Command'")
                    StepView(number: 3, text: "Press Enter and provide your password when prompted")
                    StepView(number: 4, text: "Return to this app and try the action again")
                }
            }
            .padding(.horizontal)
            
            // Command display
            Text("Command to run:")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            CommandDisplayView(command: command, onCopy: onCopy)
                .padding(.horizontal)
            
            // Buttons
            HStack(spacing: 20) {
                Button(action: onCopy) {
                    HStack {
                        Image(systemName: "doc.on.doc")
                        Text("Copy Command")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                Button(action: onOpenTerminal) {
                    HStack {
                        Image(systemName: "terminal")
                        Text("Open Terminal")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            // Tip
            Text("Tip: You can also open Terminal from /Applications/Utilities/")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.top, 5)
            
            Spacer()
        }
        .padding(.bottom)
    }
}

struct StepView: View {
    let number: Int
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text("\\(\number).")
                .font(.subheadline)
                .foregroundColor(.blue)
                .frame(width: 25)
            Text(text)
                .font(.body)
        }
    }
}

struct CommandDisplayView: View {
    let command: String
    let onCopy: () -> Void
    
    var body: some View {
        HStack {
            Text(command)
                .font(.system(.body, design: .monospaced))
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .contextMenu {
                    Button(action: onCopy) {
                        Label("Copy", systemImage: "doc.on.doc")
                    }
                }
            
            Button(action: onCopy) {
                Image(systemName: "doc.on.doc.fill")
                    .foregroundColor(.blue)
            }
            .buttonStyle(.plain)
        }
    }
}

// Preview
struct CommandInstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        CommandInstructionsView(
            command: "./execute_with_sudo.sh pmset -a hibernatemode 25",
            onCopy: {},
            onOpenTerminal: {},
            onDismiss: {}
        )
        .frame(width: 500, height: 300)
    }
}