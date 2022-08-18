import axios from "axios";
import React, {useEffect, useState} from "react";


const StudentForm = (props) => {

    let [ formInfo, setFormInfo ] = useState({});
    let [ formErrors, setFormErrors ] = useState({});
    let [ students, setStudents ] = useState([]);
    let [ submitStudent, setSubmitStudent ] = useState(false);

    useEffect(() => {
        axios.get("http://localhost:8080/student/getall")
            .then( res => {
                console.log( res )
                setStudents( res.data )
            })
            .catch( err => console.log( err ))
    }, [])

    const handleFormChange = (e) => {
        setFormInfo({
            ...formInfo,
            [e.target.name]: e.target.value
        })
    }

    const handleFormSubmit = (e) => {
        e.preventDefault();
        axios.post('http://localhost:8080/student/add', formInfo)
            .then(res => {
                console.log(res)

                setFormErrors({})
                document.getElementById("studentForm").reset()
                setFormInfo({})
                setSubmitStudent(true);

            })
            .catch(err => {
                if(err.response) {
                    console.log(err.response);
                }
            })
    }

    return (
        <div className="mb-3">
            <h1>Enter new Student</h1>
            <div>
                <form onSubmit={ handleFormSubmit } id="studentForm">
                    <div className="form-group">
                        <label htmlFor="">Student Name:</label>
                        <input type="text" name="name" className="form-control" onChange={ handleFormChange } />
                        <p className="text-danger">{ formErrors.name?.message }</p>

                    </div>
                    <div className="form-group">
                        <label htmlFor="">Address:</label>
                        <input type="text" name="address" className="form-control"  onChange={ handleFormChange } />
                        <p className="text-danger">{ formErrors.address?.message }</p>
                    </div>
                    <input type="submit" value="Submit" className="btn btn-success mt-3" />
                </form>
            </div>
            <div className="card">
                {
                    students.map((student, i) => {
                        return (
                            <div key={ student.id }>
                                <p>{ student.name }</p>
                                <p>{ student.address }</p>
                            </div>
                        )
                    })
                }
            </div>
        </div>
    )
}

export default StudentForm;