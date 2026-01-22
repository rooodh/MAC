import SwiftUI

struct LogPanelView: View {
    @Binding var logMessages: [LogMessage]
    @Binding var selectedFilter: String
    let onClear: () -> Void
    let onClose: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            // Header with title and close button
            HStack {
                Text("Hibernation Logs")
                    .font(.headline)
                Spacer()
                Button(action: onClose) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .buttonStyle(.plain)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            
            // Filter controls
            HStack {
                Picker("Filter", selection: $selectedFilter) {
                    Text("All").tag("All")
                    Text("Info").tag("Info")
                    Text("Success").tag("Success")
                    Text("Error").tag("Error")
                    Text("Warning").tag("Warning")
                    Text("Command").tag("Command")
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 120)
                
                Button(action: onClear) {
                    Image(systemName: "trash")
                    Text("Clear")
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(6)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.1))
            
            // Log messages list
            List {
                ForEach(filteredLogs()) { log in
                    LogMessageRow(log: log)
                }
            }
            .listStyle(.plain)
            
            // Bottom info
            HStack {
                Text("Total: \(logMessages.count) messages")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Text("Filtered: \(filteredLogs().count) messages")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
        }
    }
    
    func filteredLogs() -> [LogMessage] {
        if selectedFilter == "All" {
            return logMessages
        }
        return logMessages.filter { $0.type.rawValue == selectedFilter }
    }
}

struct LogMessageRow: View {
    let log: LogMessage
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            // Timestamp
            Text(formattedTime)
                .font(.caption)
                .foregroundColor(.secondary)
                .frame(width: 60, alignment: .leading)
            
            // Type indicator
            logTypeIndicator
                .frame(width: 80, alignment: .leading)
            
            // Message
            Text(log.message)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 6)
    }
    
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .none
        return formatter.string(from: log.timestamp)
    }
    
    @ViewBuilder
    var logTypeIndicator: some View {
        switch log.type {
        case .info:
            Text("Info")
                .font(.caption)
                .foregroundColor(.white)
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(Color.blue)
                .cornerRadius(4)
        case .success:
            Text("Success")
                .font(.caption)
                .foregroundColor(.white)
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(Color.green)
                .cornerRadius(4)
        case .error:
            Text("Error")
                .font(.caption)
                .foregroundColor(.white)
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(Color.red)
                .cornerRadius(4)
        case .warning:
            Text("Warning")
                .font(.caption)
                .foregroundColor(.white)
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(Color.orange)
                .cornerRadius(4)
        case .command:
            Text("Command")
                .font(.caption)
                .foregroundColor(.white)
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(Color.purple)
                .cornerRadius(4)
        }
    }
}

// Preview for LogPanelView
struct LogPanelView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleLogs = [
            LogMessage(timestamp: Date(), message: "Application started", type: .info),
            LogMessage(timestamp: Date(), message: "Hibernation enabled successfully", type: .success),
            LogMessage(timestamp: Date(), message: "Error: Command failed", type: .error),
            LogMessage(timestamp: Date(), message: "TEST MODE: Would execute command", type: .command)
        ]
        
        return LogPanelView(
            logMessages: .constant(sampleLogs),
            selectedFilter: .constant("All"),
            onClear: {},
            onClose: {}
        )
        .frame(width: 500, height: 400)
    }
}