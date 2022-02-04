//
//  ComplicationController.swift
//  yrwsm WatchKit Extension
//
//  Created by Fabian Kropfhamer on 19.01.22.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Complication Configuration
    
    func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
        let descriptors = [
            CLKComplicationDescriptor(identifier: "complication", displayName: "yrwsm", supportedFamilies: [CLKComplicationFamily.graphicRectangular, CLKComplicationFamily.modularLarge])
            // Multiple complication support can be added here with more descriptors
        ]
        
        // Call the handler with the currently supported complication descriptors
        handler(descriptors)
    }
    
    func handleSharedComplicationDescriptors(_ complicationDescriptors: [CLKComplicationDescriptor]) {
        // Do any necessary work to support these newly shared complication descriptors
    }
    
    // MARK: - Timeline Configuration
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        // Call the handler with the last entry date you can currently provide or nil if you can't support future timelines
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        // Call the handler with your desired behavior when the device is locked
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        
        let text = getText()
        
        switch complication.family {
        case .graphicRectangular:
            let template = createGraphicRectangularTemplate(headerText: text.header, bodyText: text.body)
            let entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
            handler(entry)
        case .modularLarge:
            let template = createModularLargeTemplate(headerText: text.header, bodyText: text.body)
            let entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
            handler(entry)
        default: handler(nil)
        }
        
        
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after the given date
        handler(nil)
    }
    
    // MARK: - Sample Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        let headerText = "You are"
        let bodyText = "AWESOME! 😍"
        
        switch complication.family {
        case .graphicRectangular:
            let template = createGraphicRectangularTemplate(headerText: headerText, bodyText: bodyText)
            
            handler(template)
        case .modularLarge:
            let template = createModularLargeTemplate(headerText: headerText, bodyText: bodyText)
            
            handler(template)
        default: handler(nil)
        }
    }
    
    func getPlaceholderTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        let headerText = "You are"
        let bodyText = "AWESOME! 🤩"
        
        switch complication.family {
        case .graphicRectangular:
            let template = createGraphicRectangularTemplate(headerText: headerText, bodyText: bodyText)
            
            handler(template)
        case .modularLarge:
            let template = createModularLargeTemplate(headerText: headerText, bodyText: bodyText)
            
            handler(template)
        default: handler(nil)
        }
    }
    
    func createGraphicRectangularTemplate(headerText: String, bodyText: String) -> CLKComplicationTemplateGraphicRectangularStandardBody {
        let header = CLKSimpleTextProvider(text: headerText)
        let body = CLKSimpleTextProvider(text: bodyText)
        let template = CLKComplicationTemplateGraphicRectangularStandardBody(headerTextProvider: header, body1TextProvider: body)
        
        return template
    }
    
    func createModularLargeTemplate(headerText: String, bodyText: String) -> CLKComplicationTemplateModularLargeStandardBody {
        let header = CLKSimpleTextProvider(text: headerText)
        let body = CLKSimpleTextProvider(text: bodyText)
        let template = CLKComplicationTemplateModularLargeStandardBody(headerTextProvider: header, body1TextProvider: body)
        
        return template
    }
}
