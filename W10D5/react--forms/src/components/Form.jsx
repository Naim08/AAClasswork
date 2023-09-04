import React, { useState, useRef } from "react";
import CustomInput from "./CustomInput";
import "./input.css";
function Form() {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    message: "",
    phone: "",
  });

  const nameRef = useRef(null);
  const emailRef = useRef(null);
  const messageRef = useRef(null);
  const phoneRef = useRef(null);

  const handleChange = (event) => {
    setFormData({
      ...formData,
      [event.target.name]: event.target.value,
    });
  };

  const handleBlur = (event) => {
    const { name, value } = event.target;
    if (name === "name" && value.length < 5) {
      event.target.setCustomValidity("Name must be at least 5 characters");
      event.target.classList.add("invalid");
      event.target.classList.remove("valid");
    } else if (name === "email" && !/\S+@\S+\.\S+/.test(value)) {
      event.target.setCustomValidity("Invalid email address");
      event.target.classList.add("invalid");
      event.target.classList.remove("valid");
    } else if (name === "message" && value.length < 10) {
      event.target.setCustomValidity("Message must be at least 10 characters");
      event.target.classList.add("invalid");
      event.target.classList.remove("valid");
    } else if (name === "phone" && !/^\d{3}-\d{3}-\d{4}$/.test(value)) {
      event.target.setCustomValidity(
        "Invalid phone number format (xxx-xxx-xxxx)"
      );
      event.target.classList.add("invalid");
      event.target.classList.remove("valid");
    } else {
      event.target.setCustomValidity("");
      event.target.classList.remove("invalid");
      event.target.classList.add("valid");
    }
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    const form = event.target;
    if (form.reportValidity()) {
      console.log(formData);
      setFormData({
        name: "",
        email: "",
        message: "",
        phone: "",
      });
    } else {
      nameRef.current.reportValidity();
      emailRef.current.reportValidity();
      messageRef.current.reportValidity();
      phoneRef.current.reportValidity();
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <CustomInput
        label="Name"
        name="name"
        value={formData.name}
        onBlur={handleBlur}
        onChange={handleChange}
        ref={nameRef}
      />
      <CustomInput
        label="Email"
        name="email"
        value={formData.email}
        onBlur={handleBlur}
        onChange={handleChange}
        ref={emailRef}
      />
      <CustomInput
        label="Message"
        name="message"
        value={formData.message}
        onBlur={handleBlur}
        onChange={handleChange}
        ref={messageRef}
      />
      <CustomInput
        label="Phone"
        name="phone"
        value={formData.phone}
        onBlur={handleBlur}
        onChange={handleChange}
        ref={phoneRef}
      />
      <button type="submit">Submit</button>
    </form>
  );
}

export default Form;
