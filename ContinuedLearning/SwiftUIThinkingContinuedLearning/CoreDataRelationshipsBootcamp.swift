//
//  CoreDataRelationshipsBootcamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 5/6/22.
//

import SwiftUI
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        
        do {
            try  context.save()
            print("Saved successfully")
        } catch let error {
            print("Error saving Core Data, \(error.localizedDescription)")
        }
       
    }
    
}

class CoreDataRelationshipViewModel :ObservableObject {
    let manager = CoreDataManager.instance

    @Published var businesses: [Business] = []
    @Published var departments: [Department] = []
    @Published var employees: [Employee] = []
    
    init() {
        getBusinesses()
        getDepartments()
        getEmployees()
    }
    
    func getBusinesses() {
        let request = NSFetchRequest<Business>(entityName: "Business")
        
        do {
            businesses = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getDepartments() {
        let request = NSFetchRequest<Department>(entityName: "Department")
        
        do {
            departments = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getEmployees() {
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func addEmployee() {
        let newEmployee = Employee(context: manager.context)
        newEmployee.age = 29
        newEmployee.date_joined = Date()
        newEmployee.name = "Emily"
        
//        newEmployee.business = businesses[0]
//        newEmployee.department = departments[0]

    }
    
    func addBusiness() {
        let newBusiness = Business(context: manager.context)
        newBusiness.name = "Microsoft"
        newBusiness.departments = [departments[0]]
        
        newBusiness.employees = [employees[0]]
        
        // newBusiness.departments = []
        // newBusiness.employees = []
        
        save()
    }
    
    func addDepartment() {
        let newDepartment = Department(context: manager.context)
        newDepartment.name = "Engineering"
//        newDepartment.businesses = [businesses[0]]
        
        newDepartment.employees = [employees[0]]
        
        save()
    }
    
    func save() {
        businesses.removeAll()
        departments.removeAll()
        employees.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.manager.save()
            self.getBusinesses()
            self.getDepartments()
            self.getEmployees()
        }
        manager.save()
    }
    
}


struct CoreDataRelationshipsBootcamp: View {
    
    @StateObject var vm = CoreDataRelationshipViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Button {
                        vm.addBusiness()
                    } label: {
                        Text("Perform Action")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                    }
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .top) {
                            ForEach(vm.businesses) { business in
                                businessView(entity: business)
                            }
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .top) {
                            ForEach(vm.departments) { department in
                                departmentView(entity: department)
                            }
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .top) {
                            ForEach(vm.employees) { employee in
                                employeeView(entity: employee)
                            }
                        }
                    }

                    
                    
                    
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
}

struct CoreDataRelationshipsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataRelationshipsBootcamp()
    }
}

struct businessView: View {
    
    let entity: Business
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            if let departments = entity.departments?.allObjects as? [Department]  {
                Text("Departments")
                    .bold()
                ForEach(departments) { department in
                    Text(department.name ?? "")
                }
            }
            if let employees = entity.employees?.allObjects as? [Employee] {
                Text("Employees:")
                    .bold()
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct departmentView: View {
    
    let entity: Department
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            if let businesses = entity.businesses?.allObjects as? [Business]  {
                Text("Businesses")
                    .bold()
                ForEach(businesses) { business in
                    Text(business.name ?? "")
                }
            }
            if let employees = entity.employees?.allObjects as? [Employee] {
                Text("Employees:")
                    .bold()
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct employeeView: View {
    
    let entity: Employee
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            Text("Age: \(entity.age)")
            Text("Date joined: \(entity.date_joined ?? Date())")
            
            Text("Business:")
                .bold()
            
            Text(entity.business?.name ?? "")
            
            Text("Department:")
                .bold()
            
            Text(entity.department?.name ?? "")
            
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.blue.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}
